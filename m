Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8824A386425
	for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 14:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784126811; cv=none; b=VNUkX7RX+PZoi7M4Vi9bppjKyyFU2IkpXWBrOBdtKLDIvcFAsudmnbqTcuOD3Tlr2rsQ8fO/5ndKoceg+yfrt0zh4Sbr/WTsC8TWxUDJ8+jdKiDWZcDVSg105/ne/aKPCVVNUXMMwMzQjULEyCSk9rB4HsfABSyitxGizysdA1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784126811; c=relaxed/simple;
	bh=mo64BaUYAihjdcVVKQcSfM6eK8LWt+arXGZ+s8lWgfA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BxvfMtOIIMtlvBRQdxuu6DyiIS9Jv7Ee1vGAxujwQpX9+rggSEkUFQPKrLBl3rG9ojFjGDJjDgX1tEK7jgCXzk+xofdyYFURIts0UlY+RsAaNMScmBlaj+WyfYfpf3YLE7zsh7n1m8AtJI353HEFYJ62vdm7gUQ3cU0HR5tHJYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K6F1A8HM; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K6F1A8HM"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c15f6d667bcso701001366b.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 07:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784126806; x=1784731606; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xqdxpiRH6Z2ScU/4HRU79Jz4czUFiYR0vIxP6WbDz1c=;
        b=K6F1A8HMUvelh5sWnA1PjkH2cWuNLX2ByXF2oAzo9VRe9BQhN04oFZJJEAzQ3Cz7vJ
         KVC7BftqnBpQaW5VO4habycn1nng86oxb+PdgsPmq2+xZb3CNbQ/0920ir/I13kp8BO9
         CZpuOgqMW08M6B30QB3L8cpHXDkM6CORAK8q/XDkVyhPRGbLTljKoChsA/yqEED3sGkI
         jftKGclrGuZmoM5ehsFbJr6nsIEt5MGXJMlgRL8hw+exNGK/JDQjxnoTAmNIPjEfDtiJ
         X1hBKvm4DWEXAhXaiVmxzBhDJ1UjUWgQFmmxDGpswDWFW08SQjvuGgw0KHYOaP0tr2Tv
         6LiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784126806; x=1784731606;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xqdxpiRH6Z2ScU/4HRU79Jz4czUFiYR0vIxP6WbDz1c=;
        b=Z/6X7NvdQPVZOkuA2wDpPO3Eb1xQrx+tV2Y6TBvQyJUFjPPazgs9WMtdEZtjJc34DQ
         efF6JrNuzj6sm0fuS3CsxDPUZPYHjbM5WvaQe585mzL2Nytc0Z/Gz6Azv9bQSsGf4OW3
         hBnJvUA27t1UNx34p2YcgnYuqOSEvGbKlqxrhrpykK17DElkKw9FJrSyT7eYijIMnsRw
         LulqpdJ2M1UN7icgnZfzc6DtoYOmtubC8FnD5+VcpduPo5D4nx/9+AJ524GJ7jVZqcz6
         Yn12lp0T8cvZODyaOuLdv+yyA+BuA4kZroakUmQVNvZqM/Y1nglTRT9+D7AFXwuVto4N
         7/Pg==
X-Gm-Message-State: AOJu0Yxum2ea/qZsM1J6gx/HjosqdwbEeVfMQ21e4pKasf7wLJLKwK6N
	hB4MFSEeSY5fyHc6eMGgZTlsxthVIm4L1HzEZhXNq4xi1jjgU290LXIRKtRRu7EdjmKra/+Ollj
	WlT25
X-Gm-Gg: AfdE7cmADxBUgeTbZbqxoKhZ5IIQ+h1CovhDj2J04BRPtQGM2QTLt1SCiMC5wK1wZxQ
	aEq8Qv5C1Y17SwsgZ86eyLW7e2mt0fKhyJAY+T2k9+42GkgQ/RxJSakxwJc2j3w/AmrFmEYa+UJ
	4CBgxw2Mq/Oom0kfGeFTw6ijSrxLuPnswosAHqez5Jq/TDNNPh4C1KIhYSiHWx2xY97xnQpXjIJ
	RhwMSgAbjrumdF1FdVrJTKqhxcGIdYx7dPyMP1xS7u+OcH7NFnhuDS1cHiWdgK76eYiBn0Ax5uW
	VI2VYUO3Vm32kjlyEO+Sjmfm0mbOj58sDIxiFI6O9dREV5ZCdWCORsw50kLaqWGpb86fhsl1wjJ
	/9Xhyul8ZmmsfroNNtMlRFW0M4JJ0FbXAP+Vq9NWjkaEfS8WjFdnTliguspJkAdJUwpaEJ2FeYY
	zlaBhu4f4NM56ZwiORnyfk28w=
X-Received: by 2002:a17:907:9451:b0:c16:7402:1abc with SMTP id a640c23a62f3a-c167949a4ccmr216570466b.47.1784126805726;
        Wed, 15 Jul 2026 07:46:45 -0700 (PDT)
Received: from [172.27.236.118] ([212.187.182.162])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c16873187absm45796466b.38.2026.07.15.07.46.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 07:46:45 -0700 (PDT)
Message-ID: <617b1d89-35f5-4dee-9aeb-eac7a0d34d38@linaro.org>
Date: Wed, 15 Jul 2026 15:46:44 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] tools/build: selftests: Allow versioning LLVM lld
To: sashiko-reviews@lists.linux.dev, Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: linux-perf-users@vger.kernel.org, bpf@vger.kernel.org
References: <20260715-james-perf-llvm-version-v3-0-8854bfe5af7e@linaro.org>
 <20260715-james-perf-llvm-version-v3-4-8854bfe5af7e@linaro.org>
 <20260715124513.8DA9E1F000E9@smtp.kernel.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260715124513.8DA9E1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 15/07/2026 13:45, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] Bypassing Clang's internal linker path resolution causes silent linker version mismatches for out-of-path toolchains.
> - [Low] Unbalanced parenthesis in the `USE_LD_ERR` error messages.
> --
> 
> --- Patch [4]: [PATCH v3 4/5] tools/build: selftests: Allow versioning LLVM lld ---
> commit cdccb2d14502b0641ebfd4e8ddb945bdb605ed46
> Author: James Clark <james.clark@linaro.org>
> 
> tools/build: selftests: Allow versioning LLVM lld
> 
> This commit updates the BPF selftests Makefile to use the LLD variable
> from Makefile.include to ensure consistency with the rest of the LLVM
> toolchain. It explicitly resolves paths to the linker via shell commands
> and passes the result to clang's -fuse-ld flag.
> 
>> diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
>> --- a/tools/testing/selftests/bpf/Makefile
>> +++ b/tools/testing/selftests/bpf/Makefile
>> @@ -264,30 +264,34 @@ $(OUTPUT)/%:%.c
>>   
>>   # LLVM's ld.lld doesn't support all the architectures, so use it only on x86
>>   ifeq ($(SRCARCH),$(filter $(SRCARCH),x86 riscv))
>> -LLD := lld
>> +USE_LD := $(shell command -v $(LLD))
> 
> [Severity: Medium]
> Will this shell resolution cause silent linker version mismatches if a user
> builds with an out-of-path compiler (e.g., CLANG=/path/to/clang) without
> setting LLVM= or modifying the system PATH?
> 
> Previously, passing -fuse-ld=lld allowed clang to natively resolve the ld.lld
> binary relative to its own executable path. Bypassing clang's internal linker
> path resolution with `shell command -v` might cause the build to pick up a
> system linker (like /usr/bin/ld.lld) instead of the bundled one.
> 

I can just drop this patch. I assumed $LLD should behave like the other 
tools, but it's only used here where the compiler already picks it's 
sibling linker with the correct version.

>> +USE_LD_ERR = linker '$(LLD)' not found - add it to PATH, or pass LLVM=/path/ or LLD=/abs/ld.lld)
> 
> [Severity: Low]
> Is there an extra closing parenthesis at the end of this error message string?
> 
>>   else
>> -LLD := $(shell command -v $(LD))
>> +USE_LD := $(shell command -v $(LD))
>> +USE_LD_ERR = linker '$(LD)' not found - add it to PATH, or pass LLVM=/path/ or LD=/abs/ld)
> 
> [Severity: Low]
> Is there also an unbalanced closing parenthesis here?
> 
>>   endif
> 

