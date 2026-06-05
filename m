Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154A21F30BB
	for <sashiko-reviews@lists.linux.dev>; Thu,  4 Jun 2026 23:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780616003; cv=none; b=Ep4WhsCBk5S5ERLhOQDhQe39vQ2qgGWjOZYCVWXgl9MkV0MdeCzWOKC0MC0Nan6qsxBO8ZX95n5RpHAO99bDcFjt7iyl6WDdwVtB6VA0+YjQ2Y7NOSk+ITun3CvvQX27zpojX6WJeJ5ODr6VgkqUGn7sZmdxDFeUvYCS7J/DRDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780616003; c=relaxed/simple;
	bh=Lb+xLGteN8rGNFfXJPGYAlrX4zLjvvSOH8R+LOVRa9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sT2WDekeHji3yONIhOIG3HQrb7nIK7PmMU6fVW1TxtEtHM1DPB7JsTD4tp6dDInkWYD7M1KJxwIXxav16eiDh7LjJP0zNkV2gXn2RQewbIUPw23tKf2RhKsV1mqenZx9twGLXYskzcSgvS8PfWlZaAKaSI08ZyOGjQcTsmA5PVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dMbREfQn; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dMbREfQn"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c8588ec1b44so974075a12.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 04 Jun 2026 16:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780616001; x=1781220801; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iGFlwyuNaR2/Raijzn5hJY/deT6FrQc+hecXmcS90Nw=;
        b=dMbREfQnuT4mqqFdK4xP4GB00xRJm0TlBlq+oeGxyY7jfEE8YFWxGplneYRCs72ybR
         IxJT0qydLpmxGli6bbyNSvlAB3hDx8hnQc1c3/XlzTG8k2wgpq8rp+a4oE98vqshhNSR
         Ev3XSMS5nRZDEmK9tAImLpGUqEym8/S7ISXn3x93cWv8n+LuILAayQL9AS4LgI3D4oVS
         1/KorSz/4v0PPhrQaAauEV1KzNWv3F8IkEc9fB+ZNfGz+AMA9toOmwpv+5yCX7KwYrvd
         oLG83sJDFUsJ26JMHIrQxeFVH6Flv1pvt1If3YhHQvUgJLAWEwOQ7n6ZB8a08T/UWkqz
         ZKYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780616001; x=1781220801;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iGFlwyuNaR2/Raijzn5hJY/deT6FrQc+hecXmcS90Nw=;
        b=EiKOF+0CjmhX6AyH6ZrxAU1/MXcrS1c8gAYaNxP5ALeUE9jigDnKIUrbzSsh0AtUBl
         UJjLMTU5090oRm6jJGmpN32LNpPMQAjQVhiC1akmSDeo7CNnJ/sjBEpzY+2TqSMJOf0n
         V0WrC8QoYte2SIOFFAX++OoHq++8kfU/Wtp3c15DuCaEdcPKtQ9aKev11EgouKlwfj66
         5pRE/Xn6jKMHOrTmm/gOD0F5TObbA77pDltlZ1DDzBPe/SzhdubYt2ntfU/nt9M45sOW
         KlILHtG8dHzB+EBaixqYV4ekAIP5TuFe/uQ83jGkZMWjdFL+OM/ZsmIH01OzFg+2Ngyd
         aH1A==
X-Forwarded-Encrypted: i=1; AFNElJ/kzpnGLRNYGEaMiyxLZRq91ZFbXRnGNM3+7Fk4789bchSu8tQ6+h3jM3xpKImMDpdcZ6FYJXznEi+XscjseYA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzwlh1VhSdT3W8Hxi4LIRF8wZtn8xjpoqn9luvvKT5s8qGFoahR
	/Gv98n/IW5Z4JMZYOIHffPW8j41g0fdOeoyqJwzpq8Da8zPHwPnQhfdN
X-Gm-Gg: Acq92OGrxmfz+Ag9tx6kKfnusSbb73hLfsSBLfQ4K/b2+N6vKlDC7QdAjiZMQR6V+AF
	fgZwiLqkKLnWxXuM/0snbwuOThIQGCyRh4fgUbhwFF6ijU1XwPBmGzqGyOejcQqu/fwI9jz+TVl
	2KIQNwrXCsGdybWmhwYocZdPlJcPTcxXTqr6yejOaI0mCUVJ6ejPfpQ8of8GUi2UINe58WLa4Pl
	BA4PryhS+ReI4zKMxH8TRU5xHqVfrvRd0cT7cHvqo2DDJRAK2oVU0vmPcHIsEuEasx844ygcfeC
	vobZZqHOjPeLqnrqBwDkSbl773rguV4QskvEYxvBoiA3bmkfUGVOEDCXtdgJ0hJgTT9JxfLGTRK
	7QgGONVi4C4L+Mdupyoe7CYy9XBybuwpoyRmMlLHwV2+MgtRW4L1hZxEKBn/4loZfWzDqejFI93
	Ob/xU5Xw==
X-Received: by 2002:a05:6a21:9d4c:b0:398:89b6:1b41 with SMTP id adf61e73a8af0-3b4cd066bc8mr1219019637.32.1780616001275;
        Thu, 04 Jun 2026 16:33:21 -0700 (PDT)
Received: from localhost ([2a12:a305:4::305d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0a505fsm6146958a12.20.2026.06.04.16.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 16:33:20 -0700 (PDT)
Date: Fri, 5 Jun 2026 07:32:42 -0400
From: Guodong Xu <docular.xu@gmail.com>
To: Qingwei Hu <qingwei.hu@bytedance.com>
Cc: Conor Dooley <conor@kernel.org>, sashiko-reviews@lists.linux.dev, 
	kvm@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v3 08/15] riscv: Add Zic64b to cpufeature and hwprobe
Message-ID: <a2o7tkslomyf43dcs4tultdmrzcjgvkjh736l7lqemasljhs2j@tyixe5krxw6z>
References: <20260603-rva23u64-hwprobe-v2-v3-8-5529a7b28384@gmail.com>
 <20260602232800.768311F00893@smtp.kernel.org>
 <CA+Ck9FbKRM0wjJMg1fQpdwmow8cf_zTfir7V6+T=CRxU+vomdg@mail.gmail.com>
 <20260604-rice-protegee-3a0b8e4cb609@spud>
 <u52q565xhv5s7gz3wbh4heplhbm4pv732s5kqvf4deiw6ceb4t@n4bnpzu5kabs>
 <6940420B-C9C3-4D60-AB7F-7FBC4B93D855@bytedance.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <6940420B-C9C3-4D60-AB7F-7FBC4B93D855@bytedance.com>

Hi, Qingwei

On 2026-06-05 00:43, Qingwei Hu wrote:
>
>
>> Ok, I get your point. Agree, Zic64b/Zicbom/cbop/cboz can be implemented
>> on each hart independently (at least spec doesn't say no). With this in
>> mind, the validation of Zic64b should be like this:
>>
>>    if ((riscv_cbom_block_size && riscv_cbom_block_size != 64) ||
>>       (riscv_cbop_block_size && riscv_cbop_block_size != 64) ||
>>       (riscv_cboz_block_size && riscv_cboz_block_size != 64))
>>    return -EINVAL;
>>
>> This will allow :
>> 1. A Zic64b hart with 0, 1, 2, or 3 CBO extension and block_size 64
>>   passes the validation.
>> 2. A Zic64b hart with CBO extensions but block_size is not 64
>>   fails the validation
>>
>> Thanks for the catch.
>>
>> I will fix that in v4.
>>
>> BR,
>> Guodong
>
>Hi Guodong,
>
>Thanks for working on this.
>
>This overlaps with my earlier Zic64b cpufeature patch[1].

Thanks, and you're right that your patch predates mine. Your validation
was also correct (at least resonate with what I planned to do in v4)
from the start.

>
>and Greg confirmed that Zic64b does not imply support for any CMO
>extensions[2]. It only has meaning for whichever CMO extensions are

I'll add a link to quote this in v4. Great info. Thanks for checking
with them.

>implemented.
>
>Since the Zic64b cpufeature support in this patch overlaps with my
>earlier patch, if you keep this work in your series and base it on that

Yes, I'd like to, and I prefer, take the your patch into this series, and
credit you properly. In this series, I also added dt-binding, documentation
and howprobe, and make it consumed by rva23u64 detection.

>patch, could you please put my sign-off credit for the Zic64b cpufeature part?
>
>For example:
>
>Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>

Yes, since your work came first, I'm happy for you to be the author of the
cpufeature patch, with me as Co-developed-by:

     From: Qingwei Hu <qingwei.hu@bytedance.com>
     ...
     ...
     Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>
     Co-developed-by: Guodong Xu <docular.xu@gmail.com>
     Signed-off-by: Guodong Xu <docular.xu@gmail.com>

Let me know whether this works for you.

Thank you for pointing me to your existing patch.

BR,
Guodong

>
>[1] Link: https://lore.kernel.org/all/20260528141630.2741710-1-qingwei.hu@bytedance.com/
>[2] Link: https://lists.riscv.org/g/tech-unprivileged/topic/question_about_zic64b_and/119631059
>
>Best regards,
>Qingwei Hu
