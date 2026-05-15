Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9213FB7C1
	for <sashiko-reviews@lists.linux.dev>; Fri, 15 May 2026 08:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778833517; cv=none; b=ahDF6EtQtGacTxqzxKXmbaTxL/J+3Bontq8XLtjbjuo1u8lJcfjKiVLsjKKcrGNktgbjG1WRO/b9R8H+GkgKkYp7iy+UtgTKfiHo4DvVdVlZUUjjoyR+ofGYXQT1nJYDOOj1anfoUqixIl54lURjFS3kdi/E6uPpgfK/O1PKgOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778833517; c=relaxed/simple;
	bh=x7M8QMRLEdW4Rrh+jkBoFBRBtP4oSw/c9kEx6akVmCc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Npox8hnCBsFuqNStcdikfkLlKCPZ4C5gS3LYU+Tb1If8d2XND7DNQRLEinDWu1C3J6l2fOVLLpEe7VqddGT8l6F1YbNYVedFUvJJr9QjFGAkLNqE1ka43lWtJIyun16Gvc19IpgE1ztvXhZy497Pp5JPnDwjZoqimFRvVyVCv6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dy0kXche; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dy0kXche"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43eb05b1875so5274032f8f.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 15 May 2026 01:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778833514; x=1779438314; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B8R9wMI16Tg8iAgIRKSdM3jyUIf/EyyLOvedUo+31Xs=;
        b=Dy0kXcheaKhjVAAG5uJqp3XSUCnL0+frpqVfB0vU4+1CldUaijQpYAi32XPOkg4JK4
         UUYMR7azxr2NpyvTgSLawJXuLLXL2+SaKeC8GNB2U3NZEJWmTBBZ/241dvH1ksGK4IQJ
         /NE4bJFoMgZfFDsf5oQvwwEODmFEqMTeCEWPVPYJM/seohaVTQZy/Wm/XaiFBv021rom
         C1uKuN7Wplkr969ijx0PiFIi+oveiJlIRSmCNWGjQAgzFCKl3VvqWKEJlYBpk6JEZSfW
         ijFRNdt6XO1CpkcGWLowoJ93E7I5KnoJrQavJz0BUXMJjOXnW6hYB+8rpjf6bc+Dbx0N
         zXvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778833514; x=1779438314;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B8R9wMI16Tg8iAgIRKSdM3jyUIf/EyyLOvedUo+31Xs=;
        b=TlVEzD4URMMGBgUSStOmozMfXG8dCz3UHLKK20b5chKD9GKfKtfUBE+VvuWFi9b01T
         Q24GTGUjZ5EB3c3bO1XaqD7EbUJhe5UIEvCdjCU8o1MIjxY1aOyMTK58w9VHbU/qC0XJ
         uDW/jFjQvRKsuo9kR1q0aCNnGWCv0IjmClNOBJuBABhwR1u9OBvfZlOiicvY5qNGRrFl
         xUUvfj32bE4qnvFwIFTXWDeYJ4ipnF3SDMtM6kYkNusSN8cvAiVkztb0awtvbicJ90qI
         JBJnagy1hAOqAH0fpnOGkTkyiUsRNCtl2cIoGq+xYExjf14kt49o8o3YtY8RRROtj8fu
         +sjQ==
X-Gm-Message-State: AOJu0Yx/pQ/exAO6jEMTUh704ZQlNWTH+a6f7Q6U/AjccHbCAwfbKuyk
	bv9HHxpn/74NizENV6az1qRrrYk5HezHyBLGQjrx+kL6MYBnRtuxZH8pYh7j+1ftIXW3U9bS92V
	4VTtkPyc=
X-Gm-Gg: Acq92OEAnUCEJ2Xf3wCjWu4TsYX4P476oqqQILfk3vRkJHTXgSPuVdpLRYJaRNIhuNL
	b09thP/dY5jGLIF2Z+lDbmG5159XKOguRinsh/afPCOMu47nVJ2p5OEaSq2M9sYkvly7U+RCQ1h
	ftGdDCG4i8368JVbcy4aL0nTAuXZWOHYrN/wKOptL2BAyVkIWwYgZ2XC0zsmS18sqN3hG5Vbkbe
	lXeGjh3YKPzaLmDCSKCBNN2YdI/PbZFmv6lNiDXiAVnIxejz4Ca4tbP4tKtwSgK8PmuSRY/m743
	HSOMPWfkDn9S/eZQPwWfuUubHudv/5oYIERnC9grrx8nAlTbzDF3x3LrrSG2e/VLS7R9edGDvQK
	dhzhajd7ElsKdOjTCm4utQbkIXuzmvBbq/L2e4K8c+eWzCCl/lFvYT1xeWvWuul2Vfu+544fhk3
	EExhniuV7YilJ57/4qiEUxP9rEKRf/IifTX/zBwdE=
X-Received: by 2002:a05:6000:2c12:b0:452:87de:d3a6 with SMTP id ffacd0b85a97d-45e5c6048d1mr3580229f8f.33.1778833514418;
        Fri, 15 May 2026 01:25:14 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec3ac86sm13115730f8f.14.2026.05.15.01.25.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 01:25:14 -0700 (PDT)
Message-ID: <69034d26-e886-48f2-a20b-524854a5c00f@linaro.org>
Date: Fri, 15 May 2026 09:25:13 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] tools/build: selftests: Allow versioning LLVM lld
To: sashiko-reviews@lists.linux.dev
Cc: dmitry.torokhov@gmail.com, bpf@vger.kernel.org,
 linux-input@vger.kernel.org, linux-perf-users@vger.kernel.org
References: <20260514-james-perf-llvm-version-v1-5-6cac1a9a4c8d@linaro.org>
 <20260514184543.C6400C2BCB3@smtp.kernel.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260514184543.C6400C2BCB3@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 14/05/2026 7:45 pm, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Using `-fuse-ld=ld.lld` breaks compilation of BPF selftests with GCC.
> --
> 
> commit 18e1876d18fad631b521da817483ba47293a9020
> Author: James Clark <james.clark@linaro.org>
> 
> tools/build: selftests: Allow versioning LLVM lld
> 
> This commit updates Makefile.include to add an LLD variable, matching the
> rest of the LLVM toolchain. It modifies the BPF selftests Makefile to use
> this new LLD variable instead of hardcoding lld.
> 
>> diff --git a/tools/scripts/Makefile.include b/tools/scripts/Makefile.include
>> index 380ad84ac51e6..5c2d505cba62b 100644
>> --- a/tools/scripts/Makefile.include
>> +++ b/tools/scripts/Makefile.include
> [ ... ]
>> @@ -91,6 +92,7 @@ else
>>     # Some tools still require Clang, LLC and/or LLVM utils
>>     $(call allow-override,CLANG,clang)
>>     $(call allow-override,LLC,llc)
>> +  $(call allow-override,LLD,ld.lld)
> 
> Could setting LLD to ld.lld when not using LLVM cause issues for BPF
> selftests compilation with GCC?
> 

$(LLD) is only used in one place, and it's used with $(CLANG) so this is 
impossible.

>>     $(call allow-override,LLVM_CONFIG,llvm-config)
>>     $(call allow-override,LLVM_OBJCOPY,llvm-objcopy)
>>     $(call allow-override,LLVM_STRIP,llvm-strip)
>> diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
>> index 6ef6872adbc3e..44ba829e5d4dd 100644
>> --- a/tools/testing/selftests/bpf/Makefile
>> +++ b/tools/testing/selftests/bpf/Makefile
>> @@ -245,9 +245,9 @@ $(OUTPUT)/%:%.c
>>   
>>   # LLVM's ld.lld doesn't support all the architectures, so use it only on x86
>>   ifeq ($(SRCARCH),$(filter $(SRCARCH),x86 riscv))
>> -LLD := lld
>> +USE_LD := $(LLD)
>>   else
>> -LLD := $(shell command -v $(LD))
>> +USE_LD := $(shell command -v $(LD))
>>   endif
>>   
>>   # Filter out -static for liburandom_read.so and its dependent targets so that static builds
>> @@ -258,7 +258,7 @@ $(OUTPUT)/liburandom_read.so: urandom_read_lib1.c urandom_read_lib2.c liburandom
>>   		     $(filter-out -static,$(CFLAGS) $(LDFLAGS)) \
>>   		     $(filter %.c,$^) $(filter-out -static,$(LDLIBS)) \
>>   		     -Wno-unused-command-line-argument \
>> -		     -fuse-ld=$(LLD) -Wl,-znoseparate-code -Wl,--build-id=sha1 \
>> +		     -fuse-ld=$(USE_LD) -Wl,-znoseparate-code -Wl,--build-id=sha1 \
> 
> When LLVM=1 is not set, CC defaults to gcc. The Makefile uses
> $(CC) ... -fuse-ld=$(USE_LD) to link liburandom_read.so.
> 
> Because USE_LD evaluates to ld.lld, gcc receives -fuse-ld=ld.lld.
> 
> However, GCC's command-line option parser is strictly hardcoded to accept
> only specific linker names (lld, bfd, gold, mold). It does not recognize
> -fuse-ld=ld.lld or absolute paths, and fails with an error like:
> 
> gcc: error: unrecognized command-line option '-fuse-ld=ld.lld'; did you mean '-fuse-ld=lld'?
> 
> Does this regression break the default GCC build of BPF selftests on x86
> and riscv architectures?
> 

Same as above. $(CC) is not used with $(LLD). You'd probably want to use 
$(LD) in a $(CC) build command anyway.


