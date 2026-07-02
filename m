Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989427478
	for <sashiko-reviews@lists.linux.dev>; Thu,  2 Jul 2026 00:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782950713; cv=none; b=pmaMFW9qaf227hKoLMbcABY3aoLlSQbNXyR8UbtKMxwZOM52EWx5aV3Ov4ZplsxBzFD+otvQmZKkIv54rQjwEPtyk717jaD8XSeHk/xNLB54LVupHkPnn5Pg2lMDuWeRLVcnnI9g+jPjAY9trFq/EOf6YTxRNU838aXPDn4lAqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782950713; c=relaxed/simple;
	bh=GGuYD0U3x9xemOmaz1cgpm3e9xipcYBuQshiAYqQjHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mvFT00l1fc/kb1+8aUY6Sd6lizkS0ue+NN/YXaGgFLyLGDAhvjwpkO1FaKpuNFFJZaxVKAueKRNFdAUxzQYmkDcgxhM+cXi+rMabwGFj8As84znTub67NIodbrz35VQiVJkLVABNA33/4Tux+pW2H8MnqCLNxn+5FnRFVFwnjy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k626rWgL; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k626rWgL"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493bb510ce4so8937995e9.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 01 Jul 2026 17:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782950710; x=1783555510; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WnNqoGul2fI1Hsw0bLrxAsFJTLtPg4A4vHqpqXU9hkk=;
        b=k626rWgLv/PXCW2OiVfk4nW5AN9JVy/DqrPsaZ5881Rf17yUxTLivzIh4etGV2xuo4
         aBuILT/Y8lrfzedKhsqhP+RR85Yljg0sVCe7KBjJspOSpf5rjU+gAM6cDqNwuvu741Lb
         dge7heMwMTn5Lt8/uFF2otGk0SlAGPZTk6ClYSFyWELLPVdW7TZ2LDAdiWUZEeTshTeE
         eSHfbGVQ558iif/1OtEHuqaaa0YmTuXdLTklvVzydwKJ9O0OLUMZMLuYJ6oo67tqxdXR
         nzSSk9Ubd5Zj3L8gxq2h99pdQ/MbLUOqUls+iqt0zu8E4AkA1akM2wTJSRWyih5u3lR1
         6gcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782950710; x=1783555510;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WnNqoGul2fI1Hsw0bLrxAsFJTLtPg4A4vHqpqXU9hkk=;
        b=G5QE+1jyPJseNT7CzGp8AShQjnD1cJY7zxYoPnPZNJqeQ7obplIK/S50uaarZFfjmg
         3axz7ixzP38sOEtKyp+NNRAeShrW/x9ZXoRJCmV/1BZ455Bh7BiS8MC8u+4kxKBA0Evb
         jkVBpwMx/BGXt4mLyDjdQn1lKhIHn62X1N0GwIAy9615fKLA+BoUq87QFiLXjbt0n7qi
         GoWs6/iNTJaV5NAkQfhbNtzhwR5n2qY8M4KGeCYsO0dVHKjZ/6whB6yMmKPVqvySI2rH
         LKeq4bb0fOTNntsHheg/IiPlKlb1p7NLSmZ88I8OuiQ3xVQnhI0NmQmvNLH7mRkGuKsl
         /TXw==
X-Gm-Message-State: AOJu0Ywh1IwQvnuiUZS+At+Xzz1TCyWID9EQlMaD2+qhZSWFspl2bPXU
	Y8INAzm4IpL6vRu0aI+chKn5KnhotdT2gzbHfzLWHGHZB3aAtsYzo0Dvw+f4jiR2/E0=
X-Gm-Gg: AfdE7cmmUWY0ASAEk/0hyPVlEoQrI1Y3MQyBSIvDVdkNMlKZ4TcIXSzayf5DIowJhr9
	6jwonxqn+RUOsf8fW1k120jx41N7567osusnZ3x/2JlJXeekrEmKiPlTo88X9bc2PMOSeP3boQY
	1GsG3cyQ9n71QrRs7DYZxcQAZ7EtG2fsQ2HtwfzSfXD8v2itV49ejn8ZuateVEQLrXHfqXS7crV
	VRkCoSTrHOyufBQLwBr1FkSRknauLO1wrA3YyB/g/HAJOLTOv+roawy2bdlNx0I7PpFoPlHOCHm
	fXkjqhW7k2j6TqbX/Co9MjST+ajMy8hc4Q8/zCF8ZwGFYBpVF/rGPP4poFVe12riu2dWo/U3P6o
	AAWO4HIxL63rbfodUEhGb3Hm0n19bi9jmKVhmFN7sholoETpKv3vaGsSDDhufVEDgguIBy6g1Km
	M6SfXDg0Ux27fLO5HZTni727aXMOLxLGKk+nnwunLfuuCPGN1ZkuaVN8v1K6yAQ9HpyPK/+X86o
	B5WO+P0z4ayujzFmszjRGqHX5B1LkiEB4yiIdTR
X-Received: by 2002:a05:600c:35d0:b0:493:c3cb:409e with SMTP id 5b1f17b1804b1-493c3cb42d9mr47575555e9.15.1782950709759;
        Wed, 01 Jul 2026 17:05:09 -0700 (PDT)
Received: from [192.168.0.173] (108.228-30-62.static.virginmediabusiness.co.uk. [62.30.228.108])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477dd94c8ccsm4004253f8f.21.2026.07.01.17.05.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 17:05:08 -0700 (PDT)
Message-ID: <ed2aab61-acb7-470c-98c9-c55493e43197@gmail.com>
Date: Thu, 2 Jul 2026 01:05:08 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] fbdev: serialize mode sysfs access with
 lock_fb_info()
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
References: <20260701231706.234715-1-mlbnkm1@gmail.com>
 <20260701234248.236023-4-mlbnkm1@gmail.com>
 <20260701235659.E48441F000E9@smtp.kernel.org>
Content-Language: en-GB
From: Melbin K Mathew <mlbnkm1@gmail.com>
In-Reply-To: <20260701235659.E48441F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks for the review.

I think these are broader pre-existing fbdev sysfs locking observations 
rather than blockers for this focused series.

This series addresses the mode/modelist lifetime issue and the mode 
sysfs output bounds issue. The modelist lifetime paths touched here are 
now serialized with `lock_fb_info()`, including `store_mode()`, 
`show_mode()`, and `show_modes()`, and the `FB_ACTIVATE_INV_MODE` 
deletion path clears `fb_info->mode` before deleting a matching mode.

For `show_modes()`, `lock_fb_info()` serializes against `store_modes()` 
replacing and freeing `fb_info->modelist`. I do not see fbcon itself 
mutating `fb_info->modelist` in the same way `store_modes()` does, so I 
am not adding `console_lock()` there unless maintainers prefer that 
locking discipline.

The other `fb_info->var` accesses in sysfs store handlers look like a 
separate wider cleanup, which I can look at as a follow-up if 
maintainers prefer.


On 02/07/2026 00:56, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] show_modes() iterates fb_info->modelist without holding console_lock(), which is required to protect against concurrent list modifications by fbcon.
> - [High] Sysfs store handlers (store_bpp, store_rotate, store_virtual, store_pan, store_blank) bypass lock_fb_info(), risking torn reads and concurrent driver execution.
> --
> 
> commit 52388e2c8c0d0f6bb72f9bedf44a38f798ee348d
> Author: Melbin K Mathew <mlbnkm1@gmail.com>
> 
> fbdev: serialize mode sysfs access with lock_fb_info()
> 
> show_mode(), show_modes(), and store_mode() access fb_info->modelist
> and fb_info->mode without holding lock_fb_info(). This commit adds
> lock_fb_info() in these functions to serialize with store_modes() and
> avoid data races.
> 
> Cc: stable@vger.kernel.org
> 
>> diff --git a/drivers/video/fbdev/core/fbsysfs.c b/drivers/video/fbdev/core/fbsysfs.c
>> index af21dc5052df3..d3d60c555bb86 100644
>> --- a/drivers/video/fbdev/core/fbsysfs.c
>> +++ b/drivers/video/fbdev/core/fbsysfs.c
> 
> [ ... ]
> 
>> @@ -137,12 +164,15 @@ static ssize_t show_modes(struct device *device, struct device_attribute *attr,
>>   	const struct fb_videomode *mode;
>>   
>>   	i = 0;
>> +	lock_fb_info(fb_info);
>>   	list_for_each_entry(modelist, &fb_info->modelist, list) {
> 
> [Severity: High]
> This is a pre-existing issue, but show_modes() iterates fb_info->modelist
> without holding console_lock(), which is required to protect against
> concurrent list modifications by fbcon.
> 
> Can concurrent VT switches call fbcon_switch() -> fb_set_var() ->
> fb_add_videomode() and modify fb_info->modelist under console_lock()
> without holding lock_fb_info()? Would an unprivileged user reading
> this sysfs attribute risk a torn pointer or out-of-bounds access
> since console_lock() is missing here?
> 
>>   		mode = &modelist->mode;
>>   		i += mode_string(buf, PAGE_SIZE, i, mode);
>>   		if (i >= PAGE_SIZE - 1)
>>   			break;
>>   	}
>> +	unlock_fb_info(fb_info);
>> +
>>   	return i;
>>   }
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but other sysfs store handlers
> (store_bpp, store_rotate, store_virtual, store_pan, store_blank) bypass
> lock_fb_info(), risking torn reads and concurrent driver execution.
> 
> For example, in store_bpp(), store_rotate(), and store_virtual(),
> fb_info->var is read locklessly before activating it. In store_pan()
> and store_blank(), driver functions like fb_pan_display() or
> fb_blank_from_user() are invoked without taking lock_fb_info().
> 
> Does this bypass the mutual exclusion that drivers rely on in the
> equivalent ioctl paths? Could this result in applying corrupt
> configurations to hardware or concurrent execution of non-reentrant
> driver code?
> 

