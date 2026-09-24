Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01EB4C1504
	for <sashiko-reviews@lists.linux.dev>; Thu, 24 Sep 2026 20:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790281348; cv=none; b=WGtmyDQgGktTOIr/Uyn0SZe4qB6rGDJR1PWmMRi26U1xxOVAI/BQ7BqPdJ6VqGBIx8umpDfnB+4gE2S0i/56ew5hLwrB93rR3LQOP4mNdDXr8RWp1eiw6Sv3YuYjhE8f/eZfa7YwKBL275TuOUtbZpgQUSbw6OioWHzE0WUhs2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790281348; c=relaxed/simple;
	bh=N2Z+HZuv6woGxKY6m2S5v9+oHAubeSHVW+LqkzilpMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PQsG8KvSO2ULawye/uUeYMGRmhV6+VbnDpY5sDwkT3ineEEXCOe3Ah8Q+5hOOtGvPpC0WTVsQORlo4nFWZet1jVjd/h5NkE/P0UyQeBs9eiSTd1VLBgKr33XTBKaJ0Pa55kb5fxVMjmFqLQ9bovlByKrantZfc1KyicgvRU4tv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E2z7Qn22; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E2z7Qn22"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e8185e037so1192555e9.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 24 Sep 2026 13:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790281343; x=1790886143; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IoRk7hkxlClLhVAjR4I+46m1/R/QptxYusNAx1ISo9s=;
        b=E2z7Qn22ZFUZGch+ay7Y4lfbttsQgCz1LzpJ+p0ORr7rW5e0TTS7R9Tf3faqZiXGkY
         CMlr/SVt/tTsMtJM4p5yF2xV3X/rc+RvQSZK6iRUCmMC7RaxB2n+aP0wWNel9xgp065N
         XD3oV8pvybMSY90ZJ9Ugr0BzjMWPmQbFTWvVLoOciNGXTQG8ZVwIXkQOzP3wxiQr3l6N
         FSBruCCvLs9dY9GntnGoN8hAK60TErzLMJDj1H6XByh0WxClaoe5wwy6CZJ4PP1vcaVF
         1x5VngskVwbrz7a8WixVPB6ff03P/JZDyA2256cv8ftW6Y7B+jIGbnvb6yQhcGsxttOB
         wpSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790281343; x=1790886143;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IoRk7hkxlClLhVAjR4I+46m1/R/QptxYusNAx1ISo9s=;
        b=b0uoY+kE64+Y3uz3RJoQn7iubKMLG0LWDMZuMitjUXondtB5hwdu/Z//+jTMIAN3Ij
         ZpcucC9YBnysjD4/fOQkHvbIUS3tSZQw4eXmRbkJkTm7Fl7h/WvWBDeVCEtMTnKUT6ao
         KWsoo6SX0t9eZQRoG8BgyCRJxLZUp6c/MvhGjEWdZnJncnBlbJomqM2chJszLZQ0yGpu
         PGce568YpLvwCVausDW7oe1WnbJbKtwt1/U6p7J52rBNUKAbbFb3+OJhx1XX/vZS5JSi
         W4QgbDu5Rcm4d1WcR1MaEMkbC8angFqxfWZ8QmLpulNcyZRR6SJ03ViybwzyqfhXcZGA
         wQxg==
X-Gm-Message-State: AFuF++mZiZeF4yBSjvNRZAMCVK8fvgPm3tNWhId/pNxPBUrgfFV3ZPRS
	RveiwrgKzfRbsEfDoih31UQkwIZL2v1YGgEy2cOgTCTiTOiIbcM4tMS1iR6aPA==
X-Gm-Gg: AYBFou0Y0yWdywlHZOYoCEPN6AxmJebhl69sMTLuv0Pm8z0FBM/E7zzDh0EgSKQaAAy
	tNvW6IeguXVrAks3CiLBuM+0bZjxVbHdC74nlqrm9VjjXzwpeqiM2T0urMO1BWBRiWsNlkx3pun
	cvgjY0jCa7gYatTw6tOD/kJhddd3D/uqgUMx4KaxkwULDM6DsBCh92emAMh0mgGw4QekTYAD3uj
	hJy5UIzvPhmMZ8Bi2nvvwOL9RxBGowfPA/XsB/dKrdrUUAZdjyv91iMSedbH85wdqBd5rEwc2gh
	ZlofyHekA/SKfxDAE2hpOcH8gXgfSGwSiQG4rLPv9+8sKjAhR840MLZaM8+PcGg5ogLIn+R75fI
	OhcX3AvxEg7vMJKvsDE/aCbkFCuU9NE4gWbsxNxZsdBUIMDJdnBlCn6yOWWGsy/9NGppdIMvFCa
	OKH3SH7kNSLqO8zWn/Iwy1MbNfZzm3O485PrRCTZTL+B/VMC8tQ8qPodHm/1mMBDdI/lcU2bORV
	25mL5NDospi/kMFZi7Ki6mFFyZvRO9YW53rkA==
X-Received: by 2002:a05:600d:486:20b0:49f:e941:e26 with SMTP id 5b1f17b1804b1-49ff06b2f01mr1636645e9.4.1790281342890;
        Thu, 24 Sep 2026 13:22:22 -0700 (PDT)
Received: from [192.168.20.170] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff06b6108sm3413815e9.8.2026.09.24.13.22.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 13:22:22 -0700 (PDT)
Message-ID: <bebf5c3e-74c9-4355-b4da-294a87549d38@gmail.com>
Date: Thu, 24 Sep 2026 22:22:24 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] mtd: rawnand: qcom: make check_flash_errors() more
 generic
Content-Language: hu
To: sashiko-reviews@lists.linux.dev, Vignesh Raghavendra <vigneshr@ti.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>
Cc: linux-kernel@vger.kernel.org, Md Sadre Alam <md.alam@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20260924-qcom_nandc-share-more-code-v1-0-f3012199b161@gmail.com>
 <20260924-qcom_nandc-share-more-code-v1-1-f3012199b161@gmail.com>
 <20260924200931.6ED351F00893@smtp.kernel.org>
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <20260924200931.6ED351F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

2026. 09. 24. 22:09 keltezéssel, sashiko-bot@kernel.org írta:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] mtd: rawnand: qcom: mismatch between commit message and function prefix
> --
> 
> commit a83607e63ec53429dc425262093eef9dee3bfd4e
> Author: Gabor Juhos <j4g8y7@gmail.com>
> 
> mtd: rawnand: qcom: make check_flash_errors() more generic
> 
> The function gets a qcom_nand_host pointer as a parameter but it is
> only used to extract the nand controller's private structure from that.
> In order to make the function more generic, change the declaration to
> get a qcom_nandc_controller pointer directly, and update the callers
> accordingly.
> 
>> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
>> index d7642db2e2df1..12bfb14cd9a37 100644
>> --- a/drivers/mtd/nand/raw/qcom_nandc.c
>> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
>> @@ -449,10 +449,9 @@ struct read_stats {
>>  };
>>  
>>  /* reads back FLASH_STATUS register set by the controller */
>> -static int check_flash_errors(struct qcom_nand_host *host, int cw_cnt)
>> +static int qcom_nandc_check_flash_errors(struct qcom_nand_controller *nandc,
>> +					 int cw_cnt)
>>  {
> 
> [Severity: Medium]
> This isn't a bug, but there is a mismatch between the commit message and
> the actual function renaming.
> 
> The commit message states the function will use the "qpic_nandc" prefix:
> "While at it, also change the function name to use a 'qpic_nandc' prefix."
> 
> However, the code changes the name to qcom_nandc_check_flash_errors, using
> the "qcom_nandc" prefix instead.
> 
> Could the commit message be updated to match the code, or should the
> function be named qpic_nandc_check_flash_errors?
> 

May bad, the commit message is wrong of course. I will fix it in the next
version, also in the the other patches.

-Gabor
