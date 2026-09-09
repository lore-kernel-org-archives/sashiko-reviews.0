Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9A25678F9
	for <sashiko-reviews@lists.linux.dev>; Wed,  9 Sep 2026 13:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788960652; cv=none; b=SG08XP0Bni4YJsuhYd+UB2CaxggyDlWnRVBAbZRvf3fRY84uy6hKiaKrOgTTl/QYXQEYUNuKiUxKKTbBd2OnRPPEMzNG2MuNivt0D+6dTPqbtr5DHrko4jWvCRfIp6zBnZMbUnFkaKE0LJbXdZW70POZO0QYtFW0P+DAk3N1pdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788960652; c=relaxed/simple;
	bh=9kaM9ocsc1ZqBHkd6itoHMxsLyIdWneW8aHZkndQQLc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oSwCD0DBbpvj6n6DFq9iMBayEjEUB4cIru+UUQr/zg9+W/RgUPIXxPGvYqIhM8c6izaMyBh2nSVM5y8zexMoB24UnynNBjYhi8kWHTse7K3HIdOOzxoTAW7tWXbx6XP1lG10pvVKtLWlwmNmOP+woPnjVb/ekhhXCKkaXkYPUF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RSbsmqhq; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RSbsmqhq"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c293ae2bab5so61481766b.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 09 Sep 2026 06:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788960649; x=1789565449; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fF1cEFcgyVPOEPUq/61SXtv1bN/BnUewuuhHxkdbS5w=;
        b=RSbsmqhqyAtrgV5xfNgIDi8Hi7l/baVz+dv/gIu8xNx4s5SynptMsSj1MtlFqUxJqk
         QgsW8/mKXR3DEIbrwNETEGtHf8WwVCmGFGkkq6AkcUFggaQmyoaphrugLn1Jd/ptGzNp
         6pwPfqDmosZrQo8BNVwxN+pmkqhXe1NQumZ7QLzhl43CY9CxGnuAXpsikwtvWwD9yAYn
         tanSj7auAxFfj8GxTeI01QlKDFPy6eWnkkKfD2ntKD4a1z/+R0Ph65NjgaS9bs2ygk8h
         EA9ZqFBxkOLB5hi7/+Sb1WRwsATBN06w92bH6BjWaQuxqkhTkzGlAGhFsHik/EjqJRj3
         e4xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788960649; x=1789565449;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fF1cEFcgyVPOEPUq/61SXtv1bN/BnUewuuhHxkdbS5w=;
        b=dfN0RwrPpbHmAe9ErmtRL19BKrB03zz7rlSHq8u3tYFynPxp5wKPt9nCopvFdDpNAc
         RhyxkTc5Aj9LKwAxwYtR+P+bt7z9Fzc8MsNQRTEm3Im/SqQB9Ggr+QU0W7dFh7Rxe6+g
         mv1kZjpvY1kK3LpSyzELPn1XBdfRT1PqzbOxFTTiuPKZvfEZdOcMHY2DchO8lu8I+wjW
         oOJqDV7o5E7SkJ3CMJh7sFRzRoX5BxHmQRhk5eCY6kCFfBXPoLXW7IGDLKCZXabN7N0X
         4vE3dl08PSErDXlo3mCmrPORvKWKANmvUPYIVUEwj6LpWqKOgeXKS4+jF2sC/Cue+n6d
         pmvQ==
X-Gm-Message-State: AFuF++lmPBeAEG3dUmWAyo+4gZGyhmspDRWsDljbRKayiJ5idT3IwcI0
	RvsKBIHsAkO96TJMbIz1ulrMDj57SN08zDIR5wX7Y1k23VDZTmNLezFoVdqBiY3i9P8ukQmt
X-Gm-Gg: AYBFou0MyIofybYRJLD/UY6nCz6rJlkGx8kCDD6ebvzBHfG8e6D/1wmzPK8dKsPTN9q
	trQthS07XjTNwkrSRnv3kXuh9bqnYCakRgeVs2wDqK/iPiHxRXPsK1Bxm5XgZhDZ1lzXHArdBqq
	Sz50FjhqN7YPrz9motjmu6okHXZNi9AimrIdpFXCA8RMnqHVgHDtYyTmc8z26SXodte/RO45HAh
	gXr9rfhtk4zYVq4M/h/XmP8pDpwQ8BeqvaJ2ZunTLMNTJ5yNirTnUHgb9SXJWoLInfaQX8l7+l/
	n8SjHMpI/4oU3ENaN2tFAg7ZiU3vqDXFmOspwHW2SdSEsSizsdx8p1nGGRdXS0kb616C2nH3tLu
	Fqwyolwu1f+K/wKtSQlVpz+lS4VB7etHx7Oy8ExzfhaGs6d1KpONJwD2AmgleMdbeb6f8Au9NIs
	mM/4uBGWOYVqjTmXzOV86YqDi3yFnWoCGekQ6SyTjeHlo64sikYbWz4k9smBeDkq0b5UGz89Z9W
	pOM
X-Received: by 2002:a17:906:4789:b0:c24:e0dc:8b66 with SMTP id a640c23a62f3a-c260c8dc700mr1541952166b.6.1788960648727;
        Wed, 09 Sep 2026 06:30:48 -0700 (PDT)
Received: from localhost ([45.112.44.120])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c262ccca940sm616338266b.18.2026.09.09.06.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 06:30:48 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Wed, 9 Sep 2026 21:27:47 +0800
To: sashiko-reviews@lists.linux.dev
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Sourabh Jain <sourabhjain@linux.ibm.com>, 
	kexec@lists.infradead.org, Pratyush Yadav <pratyush@kernel.org>, 
	Dave Young <ruirui.yang@linux.dev>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mike Rapoport <rppt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Baoquan He <baoquan.he@linux.dev>, linux-arm-kernel@lists.infradead.org, 
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 1/9] crash_dump: Fix potential double free and UAF of
 keys_header
Message-ID: <aqFeOaIxKNMKVOTM@Rk>
References: <20260909003657.1570544-1-coiby.xu@gmail.com>
 <20260909003657.1570544-2-coiby.xu@gmail.com>
 <20260909005311.B1E471F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260909005311.B1E471F00A3A@smtp.kernel.org>

On Wed, Sep 09, 2026 at 12:53:11AM +0000, sashiko-bot@kernel.org wrote:
>Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>
>New issues:
>- [High] Prematurely clearing `is_dm_key_reused` breaks the ARM64 kexec_file_load retry loop and defeats hotplug dm-crypt key reuse.

Thanks for catching this issue! I'll send a new version to address this
issue.

>
>Pre-existing issues:
>- [High] Mapping crash-reserved memory with `kmap_local_page()` causes out-of-bounds reads if dm-crypt keys exceed a single page.

x86 is not supported so I think this concern can be dismissed.

>--
>
>commit 9cf0538566bf6406e97a7f29629856abff44a5b0
>Author: Coiby Xu <coiby.xu@gmail.com>
>
>crash_dump: Fix potential double free and UAF of keys_header
>
>This commit addresses a potential double free and UAF of keys_header when
>loading dm-crypt keys for kdump. It establishes an invariant to free
>keys_header at the end of kexec_file_load unless reuse=true.
>
>> diff --git a/arch/arm64/kernel/kexec_image.c b/arch/arm64/kernel/kexec_image.c
>> index b70f4df15a1ae..1a0ca54adc9a4 100644
>> --- a/arch/arm64/kernel/kexec_image.c
>> +++ b/arch/arm64/kernel/kexec_image.c
>> @@ -110,6 +110,7 @@ static void *image_load(struct kimage *image,
>>  		image->nr_segments -= 1;
>>  		kbuf.buf_min = kernel_segment->mem + kernel_segment->memsz;
>>  		kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
>> +		crash_dm_crypt_cleanup(image);
>
>[Severity: High]
>Does this call to crash_dm_crypt_cleanup() during a retry loop unintentionally
>free the keys_header buffer?
>
>Since crash_load_dm_crypt_keys() unconditionally clears the is_dm_key_reused
>flag before returning, any mid-retry cleanup performed here when segment
>placement fails will see the flag as false and wrongfully free the valid
>keys_header buffer.
>
>>  	}
>>
>>  	if (ret) {
>
>[ ... ]
>
>> diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
>> index c685497cd470e..f638fb4b8554c 100644
>> --- a/kernel/crash_dump_dm_crypt.c
>> +++ b/kernel/crash_dump_dm_crypt.c
>> @@ -84,18 +84,25 @@ static int add_key_to_keyring(struct dm_crypt_key *dm_key,
>
>[ ... ]
>
>> -static void get_keys_from_kdump_reserved_memory(void)
>> +static int get_keys_from_kdump_reserved_memory(void)
>>  {
>>  	struct keys_header *keys_header_loaded;
>> +	size_t keys_header_size;
>>
>> -	arch_kexec_unprotect_crashkres();
>> +	keys_header_size = get_keys_header_size(key_count);
>> +	keys_header = kzalloc(keys_header_size, GFP_KERNEL);
>> +	if (!keys_header)
>> +		return -ENOMEM;
>>
>> +	arch_kexec_unprotect_crashkres();
>>  	keys_header_loaded = kmap_local_page(pfn_to_page(
>>  		kexec_crash_image->dm_crypt_keys_addr >> PAGE_SHIFT));
>>
>> -	memcpy(keys_header, keys_header_loaded, get_keys_header_size(key_count));
>> +	memcpy(keys_header, keys_header_loaded, keys_header_size);
>
>[Severity: High]
>This is a pre-existing issue, but does this copy read out of bounds?
>
>kmap_local_page() guarantees mapping exactly one physical page frame. If user
>configuration has enough dm-crypt keys (e.g., > 10 keys, where each struct is
>388 bytes), keys_header_size easily exceeds the 4KB page size.
>
>Copying beyond the single-page mapping will cause out-of-bounds reads and
>could trigger a kernel panic on systems with HIGHMEM or when
>CONFIG_DEBUG_KMAP_LOCAL is enabled. Could memremap() be used instead?
>
>>  	kunmap_local(keys_header_loaded);
>>  	arch_kexec_protect_crashkres();
>> +
>> +	return 0;
>>  }
>
>[ ... ]
>
>> @@ -441,18 +458,33 @@ int crash_load_dm_crypt_keys(struct kimage *image)
>>  	r = kexec_add_buffer(&kbuf);
>>  	if (r) {
>>  		pr_err("Failed to call kexec_add_buffer, ret=%d\n", r);
>> -		kvfree((void *)kbuf.buffer);
>> -		return r;
>> +		goto out;
>>  	}
>> +
>>  	image->dm_crypt_keys_addr = kbuf.mem;
>>  	image->dm_crypt_keys_sz = kbuf.bufsz;
>>  	kexec_dprintk(
>>  		"Loaded dm crypt keys to kexec_buffer bufsz=0x%lx memsz=0x%lx\n",
>>  		kbuf.bufsz, kbuf.memsz);
>>
>> +out:
>> +	is_dm_key_reused = false;
>
>[Severity: High]
>Does prematurely clearing is_dm_key_reused here destroy the state needed for
>the segment placement retry loop?
>
>On ARM64, if the first attempt at segment placement fails, the kexec load
>code retries the loop. Since the flag is unconditionally cleared here, the
>first iteration will clear it. When the retry cleanup executes in
>image_load(), it will see is_dm_key_reused == false, freeing the keys_header
>buffer and leaving subsequent retries without the required keys.
>
>>  	return r;
>>  }
>
>-- 
>Sashiko AI review · https://sashiko.dev/#/patchset/20260909003657.1570544-1-coiby.xu@gmail.com?part=1

-- 
Best regards,
Coiby
