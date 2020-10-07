<?php

namespace App\Helper;
class CheckPlagiarism
{

    public static function getPercentage($target, $source){
        $a = similar_text(self::preprocessData($target), self::preprocessData($source), $percent);
        return $percent;
    }
    protected static function preprocessData($target){
        $stopwords = str_replace(array("\r","\n","\r\n"),"",file('./stopwords_id.txt'));
        $target = strtolower(preg_replace("#[[:punct:]]#", "", strip_tags($target))); //hapus tanda baca
        $target = preg_replace("/\d/", "", $target); //hapus angka
        $target = preg_replace("/\s+/"," ",$target); 
        $tokenization = explode(' ',$target); 
        $words=[];
        foreach($tokenization as $word){
            if(!in_array($word, $stopwords))$words[]=$word;
        }
        return implode(' ', $words);
    }
}
