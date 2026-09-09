Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD3D568533
	for <sashiko-reviews@lists.linux.dev>; Wed,  9 Sep 2026 13:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788960659; cv=none; b=ComVLFAS1QDncEhNDfSLmmZLkY000j66VmQohT4h1WUyXw+qq0K7yQzzeGb58/98om3cW6AfmcGCgRlN2L7NnFbeVphUo2p1Wkq8RSP0Q3Pxvzy1oq8kLaxZIkwSfnbgeRACW3j/53fghjavxbx8WmxDfv/51s1f5wmzZJgBtSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788960659; c=relaxed/simple;
	bh=thIkh/FqJgrHGNwWazQNf90HmoaawerIOEixm53nYfs=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RO0MEz6Q6NznbobyeTgJ4sxLG0zF7lmUdKSBJDdv9Ua4ElGEmU3rCW5ZyKqKg6mVUNcobL1MeMjMJasFfvg6ej//m46KrsPe9gj8aJX0VCsBlBYXiERqtDhOVwuVoLToEfQ5N134e6n4ontuIsOmn+kHB1glO9a8fMlWlseGQ/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gjHih5ON; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gjHih5ON"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c250a2bc3b3so721195566b.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 09 Sep 2026 06:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788960656; x=1789565456; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dxNdm96bKIoWq/16pYhKcq8ECSivtcVW8xJ/F+AWQTI=;
        b=gjHih5ONrDF8mK9eC0MRWHOJy/s6xuB0OMkhUVGI72Lxp+ERqLqywyFESA11y9O0El
         LNXT1WoXwd3qM6OhZL1tmOJ2EAWCaogPVhfUJoPWPKsMs0OHpSFpim2a2F91LSr6AC0H
         M+rDev1Qym6MxCV/IwNx7uSNAW65LiVsxj4xnRcNakU83iDzTU1e+2gbXy7Xxvmk6ZZd
         0tNcz+NzgtK3zeokrMNKVfjdcHfWrE5Euig8F6aMKibfclPycpEklJFsK1kgUFAWMOdk
         MGrpLUdwSrFTcQPffAVE9lDfuoYIek5ew60BBBNkyQ/zjPGj5fBJmcQtjSPsz2oUGjZc
         +ZRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788960656; x=1789565456;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dxNdm96bKIoWq/16pYhKcq8ECSivtcVW8xJ/F+AWQTI=;
        b=jrJ1RLweR1m5CDj05RmddrN7pyQj53Rn+PSx2hCMDXNEvITsRO2pW/CCBFrTOmWmXH
         e/wnkGyWmhpM+K1UwfVcmVgG8NHMGjVPegn2+PJisL3qRai477RiMpHGyx2R+nPpSfv3
         wQ8qFALeRupNwNFBOwf1xar9942nELq9g4vzFwGxM6PYh1pUFnbahqQgK/XisojbRMJY
         QBvroOp4DqVcOOuQFpk7uPpTOQKePiqUCE+U1Ca9zl40oyGUR5m6sCvf3dy7sYHbAG3x
         KH9UG3xJMVebWcdr5TjAjcchTa1BBnyyw4//bEdyfXRpSkz5u7DbZ60Dpckvy31rG/u+
         sE/g==
X-Gm-Message-State: AFuF++m9qwdmvOU+SKAnA/FElUt+GVwdqKzOfbkYY7vZ5eELQOYJd7Av
	pcW/N4iwaCI43Bf1wLyfpOc0vtbkp0mSYr/7V2J4pdv+5dOmqYj7pdoGIejvl/N8rFm38ww/
X-Gm-Gg: AYBFou0QTeggoORWkEUvz5gPybNv32Djmtdd+y+nKwQVrp7iUTaBNmvleXbd1yduf9P
	Oef1OV/BYNRPa5WRWvnyARhYn6grV7KYynpdwlivJNwcnLJ9TLEVF9LFmWGhm3PiMMVcGuMGk+7
	eZqtZbp7tj1Sm6Tk01/hhG/LQjhbCYJC0q2FhXVGe8uXGL4WceYOfhHE20holhT2VfIf4s7yEyW
	rO5LTlkF70uuDfxwA5D95U7rwGbhKDaUOIm3A7+j1rFrLZZEFr/6uThIo1QsXgOGxs23F8DpL9N
	8/2+FFliUjylRjpoOEf8rJo6fORxCZFkFQF42TRsEzK2m6HjO8EclHTYu2oI0J9zu8tKUHx5LLU
	1jwayq81gktr0XEF9Ro6HgpI5TXdfo3/5dmLHh3LL+JffJRM8rGPBOTkJem1zDM8DgaS57F10kx
	vHPdwBOzhhoqJeqm7INaj0v8/uMXmGI3Hby0QzvhhP7Jqx9vMbJGEoE0sDFM13rhDayA==
X-Received: by 2002:a17:907:1c18:b0:c16:4e5:944a with SMTP id a640c23a62f3a-c260ca241admr1431773366b.21.1788960655994;
        Wed, 09 Sep 2026 06:30:55 -0700 (PDT)
Received: from localhost ([45.112.44.120])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c26e956ea81sm568148766b.33.2026.09.09.06.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 06:30:55 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Wed, 9 Sep 2026 21:29:14 +0800
To: sashiko-reviews@lists.linux.dev
Cc: Baoquan He <baoquan.he@linux.dev>, 
	Sourabh Jain <sourabhjain@linux.ibm.com>, Dave Young <ruirui.yang@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, Jinjie Ruan <ruanjinjie@huawei.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, open list <linux-kernel@vger.kernel.org>, 
	Pratyush Yadav <pratyush@kernel.org>, Mike Rapoport <rppt@kernel.org>, kexec@lists.infradead.org
Subject: Re: [PATCH v5 3/9] crash_dump: Disallow writing to dm-crypt configfs
 during kexec_file_load syscall
Message-ID: <aqFe50U0bp4dguMT@Rk>
References: <20260909003657.1570544-1-coiby.xu@gmail.com>
 <20260909003657.1570544-4-coiby.xu@gmail.com>
 <20260909004722.649E21F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260909004722.649E21F00A3A@smtp.kernel.org>

On Wed, Sep 09, 2026 at 12:47:21AM +0000, sashiko-bot@kernel.org wrote:
>Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>
>New issues:
>- [High] Severe locking imbalance in `crash_load_dm_crypt_keys()` leads to a leaked mutex on the error path and unlocking an unacquired mutex on the success path.

Thanks for catching this issue! I'll address it in new version.

>
>Pre-existing issues:
>- [High] Premature and unconditional reset of `is_dm_key_reused` to false breaks ARM64/LoongArch kexec load retries and defeats intended cleanup logic.
>--
>
>commit a9405cf8948ba39213612c61a1f3b10b23f437e4
>Author: Coiby Xu <coiby.xu@gmail.com>
>
>crash_dump: Disallow writing to dm-crypt configfs during kexec_file_load syscall
>
>This commit prevents concurrent writes to the configfs group during the
>kexec_file_load syscall by utilizing config_keys_subsys.su_mutex. It aims to
>avoid buffer overflows, stale keys, or memory leaks caused by changes to
>dm-crypt keys during iteration.
>
>> diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
>> index 3a416933979f8..580534d43b66e 100644
>> --- a/kernel/crash_dump_dm_crypt.c
>> +++ b/kernel/crash_dump_dm_crypt.c
>
>[ ... ]
>
>> @@ -478,6 +490,9 @@ int crash_load_dm_crypt_keys(struct kimage *image)
>>  		"Loaded dm crypt keys to kexec_buffer bufsz=0x%lx memsz=0x%lx\n",
>>  		kbuf.bufsz, kbuf.memsz);
>>
>> +unlock:
>> +	mutex_unlock(&config_keys_subsys.su_mutex);
>> +
>
>[Severity: High]
>Looking at crash_load_dm_crypt_keys(), if kexec_add_buffer() fails earlier
>in the function, it jumps to the out label, bypassing this unlock label.
>Does this leak the config_keys_subsys.su_mutex if the lock was acquired?
>
>Also, on the success path, mutex_unlock() is executed unconditionally. If
>is_dm_key_reused was true at the top of the function, the mutex was never
>acquired. Can this cause a kernel panic or corruption by unlocking an
>unacquired mutex?
>
>>  out:
>> -	return r;
>> +	is_dm_key_reused = false;
>> +	return r;
>>  }
>
>[Severity: High]
>This is a pre-existing issue, but since the error and success paths
>unconditionally reset is_dm_key_reused to false here, does this break
>architectures like ARM64 that might retry segment loading?
>
>If load_other_segments() retries the load sequence, the second pass
>through crash_load_dm_crypt_keys() will see is_dm_key_reused as false,
>find zero keys, and silently load nothing into the kdump kernel.
>
>Additionally, crash_dm_crypt_cleanup() checks !is_dm_key_reused to determine
>whether it should free keys_header. Since the flag is unconditionally cleared
>here first, does this defeat the intended cleanup protection logic?
>
>-- 
>Sashiko AI review · https://sashiko.dev/#/patchset/20260909003657.1570544-1-coiby.xu@gmail.com?part=3

-- 
Best regards,
Coiby
