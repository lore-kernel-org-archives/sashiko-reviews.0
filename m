Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97370480DCD
	for <sashiko-reviews@lists.linux.dev>; Wed, 10 Jun 2026 20:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781124205; cv=none; b=JR7R36SrQIXihjtwmOqehLVN5tGdn1IYzDooDphk5zZpsUsfUrW+YgPxbubCM3TgsenqL1JUt1J52Dy5xET9Snma04i1fH217NZDRCcdNVAtIqNHEZoP5eANUATdHaLiPnsLoHlpSCN1je27a5gxPfEo1N2a/pJ39e4eR/FZvQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781124205; c=relaxed/simple;
	bh=eECEFWKviFGovSY8dv4YhSbKFI3KHDczqXjfIHtU4KI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KHTeqgjhvSiHYJ0JIaUXcyPDQORI+NQbmw564s9RtSU/hWctYia4weeeLiZz4FR6CqWNoYX/tMneV+/xxuEgrswpyKN0r9n92VScl6YIQmyXbnA1ufZup6NG5Tj2rskmDIpyyaFojLj+B74RCbXKcWA4dXXN2UgFEv7XoAp0ltU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SSNlAr5x; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SSNlAr5x"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-4865e953031so266479b6e.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 10 Jun 2026 13:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781124201; x=1781729001; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NpiWNaJanDKRHuWCGrhJcww0s9XnS0dPsuz5e44KkOA=;
        b=SSNlAr5xmTerl19NcYw+X7n1rT7Z/qMwY53uynd5I47bnGq1YWG5yqWEKlqzy+C7Qg
         6b8d2HXWKHzsY/H12Oa1OaDI2CbQ3MGvxTF1596ejcoGj/E1XVGEv4hvJsj7igoDGCEP
         pLVo5F5wwKsR3FeEPACWdbGyKf9kN67DXpJkzwNXNR9Ad0eg3SlijJS2XtAMfwvSZ0zt
         8PXLjAsDy8p32bIwB9QGnCbLuT9KL5AAg4+Pjpt+FhtVzn/wS9Xr4esdFPT6/u7PaACG
         94iEc1gLXlByNl2lcvnPwCPFpiJ2P9SN/gY7AFyd9zl0eCxARrxPf4iVDkKhW7npgZhU
         Hoaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781124201; x=1781729001;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NpiWNaJanDKRHuWCGrhJcww0s9XnS0dPsuz5e44KkOA=;
        b=GdTwSjsLhaMD7MTBRFzKDvRBGyz0POanWjPHFiPlzHXZ7+K7jAMtx+WmRMsATuzcdQ
         BfpW3XBjCaejn/UMFFgBEpMr01QaV/gn4T0nSBvHFJshuwRP744wppRsVwbhfuMUkeLC
         FrEs7ihQ0Nh7zkTgCnIi8w2/xLBqeq+61Wet59onKqhVE/2m0n1//GSf4uPb3YSD/IQt
         rhwSbUjxBIzXzGCIWexsnDX0fGK7vCAsHmFDQCBI+wRBNWU0DE+WxOPZukQjoJhyKp1S
         lbP31H7ZEhRs3Sgh/O5uIKDzZyrwPGhFuvqNQHzkWMSek2yABdNVb08sYr+jk1WFEFzD
         DNzw==
X-Gm-Message-State: AOJu0YyLAHkUdc7CM62FgXB3LXAJi9jWrZn75PlnSkjqJxN+2nI3/Fn4
	c8RpxfeGwC6CBE9+CHOyr/yskXWrwAV6PBfHHs2bsAjmL/NANidWCUlSciXLpA==
X-Gm-Gg: Acq92OETRQkds16D1Um/aAi6mNnEzujSblnhzH9aOWsxe+h3mnAeyoju93073x6+TFg
	AKYmQ5iSTJqkuTvXc0a3HiGIaPzil0eWFv+yQAjqCrM2ZEFqq5r06BZmI2nL1f51z2KOD1htkHx
	aby+Dt7jmBZ34KqicICfequg9wkt21fGgsU/UUTEnnK1B7gR4bEIvWVEFOpg14Y9iS0gWGsTsvf
	98vpGwqNt4JDJJKjJy82aQtAWzlO9ZetO5r/yZjjSkaXHN1EsmVBFUx4vXKTOWFYNHf9Jl6oTP9
	LYTpGFrQkxOp2yxcfhhX7BCtGRmQJ7fflGCSuI186DbbuTjN2YpW5et8cTn3g2Wn5BwTs0vTFxP
	FvUAtybHyVLLP+cl7SRaQMrwCQs9PoLKq3QYfebzo29zcRUkyW9ZS9DyaMZiQICEgZj32fZT29b
	7TraRduvcl3buJuA//njsvsUw2KocQaqOn1Dv85pS/V1gmw6YT3gLBfNGet263BdgA1AKCVwei5
	3mx0ZwxtKDuY0jrC6WREcM=
X-Received: by 2002:a05:6808:2f08:b0:479:eead:df9 with SMTP id 5614622812f47-48717b1f6a9mr224413b6e.4.1781124201362;
        Wed, 10 Jun 2026 13:43:21 -0700 (PDT)
Received: from ?IPV6:2605:a601:aab9:5000:dc49:41fd:5d54:871a? ([2605:a601:aab9:5000:dc49:41fd:5d54:871a])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4865b5a53bcsm19419533b6e.3.2026.06.10.13.43.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 13:43:20 -0700 (PDT)
Message-ID: <ca27f17a-d95e-471b-ad4f-ecbf6be1104d@gmail.com>
Date: Wed, 10 Jun 2026 15:43:19 -0500
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] scsi: target: Allow FUA if no write cache enabled
To: sashiko-reviews@lists.linux.dev,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-scsi@vger.kernel.org
References: <20260609202156.90700-1-stuart.w.hayes@gmail.com>
 <20260609203953.154771F00898@smtp.kernel.org>
Content-Language: en-US
From: stuart hayes <stuart.w.hayes@gmail.com>
In-Reply-To: <20260609203953.154771F00898@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/9/2026 3:39 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Critical] Silently dropping the FUA bit when WCE=0 prevents the backend from honoring the FUA request, causing silent data loss in the fileio AIO backend.
> --
> 
> commit 5cb17faff566c1313276f5a67af675e43649d8d6
> Author: Stuart Hayes <stuart.w.hayes@gmail.com>
> 
> scsi: target: Allow FUA if no write cache enabled
> 
> This commit modifies the target core code to ignore the FUA bit in SCSI
> commands for targets without an enabled write cache. This allows systems
> with firmware that aggressively sets the FUA bit to successfully boot
> without failing due to unsupported FUA write errors.
> 
>> diff --git a/drivers/target/target_core_sbc.c b/drivers/target/target_core_sbc.c
>> index 21f5cb86d70c0..ffd2b6c9bd231 100644
>> --- a/drivers/target/target_core_sbc.c
>> +++ b/drivers/target/target_core_sbc.c
>> @@ -754,6 +754,12 @@ sbc_check_dpofua(struct se_device *dev, struct se_cmd *cmd, unsigned char *cdb)
>>   	}
>>   	if (cdb[1] & 0x8) {
>>   		if (!target_check_fua(dev)) {
>> +			/*
>> +			 * Silently ignore FUA if there's no write cache.
>> +			 */
>> +			if (!target_check_wce(dev))
>> +				return 0;
>> +
> 
> [Severity: Critical]
> Does returning early here prevent the command from receiving the SCF_FUA flag?
> 
> By returning 0, this bypasses the cmd->se_cmd_flags |= SCF_FUA; assignment
> that happens further down in sbc_check_dpofua().
> 
> While WCE=0 implies no write cache, the fileio AIO backend relies entirely
> on the SCF_FUA flag to ensure synchronous writes:
> 
> drivers/target/target_core_file.c:fd_execute_rw_aio() {
> ...
> 	aio_cmd->iocb.ki_flags = IOCB_DIRECT;
> 
> 	if (is_write && (cmd->se_cmd_flags & SCF_FUA))
> 		aio_cmd->iocb.ki_flags |= IOCB_DSYNC;
> ...
> }
> 
> Without the SCF_FUA flag, fd_execute_rw_aio() will issue asynchronous
> writes without flushing the cache, as it ignores the O_DSYNC flag set on
> the underlying file descriptor.
> 
> Could this regression lead to silent data loss on power failure, since
> what used to be rejected as an unsupported FUA write will now complete
> asynchronously without a disk cache flush?
> 

Valid point, yes. I will fix.

Also, I accidentally submitted this as V2 when it should have been V3, 
sorry.

>>   			pr_err("Got CDB: 0x%02x with FUA bit set, but device"
>>   			       " does not advertise support for FUA write\n",
>>   			       cdb[0]);
> 

