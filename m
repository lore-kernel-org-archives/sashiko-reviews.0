Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E80831714F
	for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 09:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779097678; cv=none; b=pDhnwkNuUU5FDhw41UpFFBVOB52N6S0kHVkIxvE5wfHI+oZU0Z26YhXqY7NqXyUpwkUSxTNtm/lP+tx+h48k3cQZiIZMe/aXe5IWRfU7coWWz/RJKSUVT8mGbx5vQfjzzKt5Ey0RFIcsIZK/CmJGrMV3nvqiVtuxeAiZ4ApGR3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779097678; c=relaxed/simple;
	bh=kQwAY/l0CYICe34k0IpNyn+TG1YD4kxDzsA4u0x5DHg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PMXvFXPjPsB+VW3Xnt++1yvT/qQRaDxqmWB3QNaTnmmMzYjq4mNFvoL6IoltRwOY59CSpAiTL2VnjJrSVPzBu94vgcLxYVUgNS5AfdelnhBi91ko5yts8OJRF9e+bxs+c54yUAo2fjQd0IJikS5a+W3ma5kqtCv78p5uhmc0Yng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W7Z3J/Vp; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W7Z3J/Vp"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488b0046078so18169765e9.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 02:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779097676; x=1779702476; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T/EO1D6TrcoAaYAZG0MsX8/FpcPXBdwplKszfXP85PU=;
        b=W7Z3J/VpFJRS7jspLf8ZoJs/qpuZVFP99TQ7NBHN1eMH7NzzXtUi2ayOHgg6D6vz4J
         oubnDwBa8ihL0oMq4o/5gB8UsqurV+nfVADcROuNzLurgRYAFJJGyuXudD4tXQk9VDBs
         mcLvhM+ZCwqnaaktJABRnRlrGJimiuK0m1yoC3CSt100OFWfxWXI6RXrgWAx8lSK0J7+
         Y2LkdWfXz7ub/5eB9p0G96sNm+K7d3rlpku174uSft3s6fQMfU+DlGg6z/DKQXN+qEuc
         l2EStdM0PyxLvJJzbMUUaw35Oin5RbNwCaqLgKsqmZwbTQcSVkFCLFWsfrfRMXtR+oyD
         2Agw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779097676; x=1779702476;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T/EO1D6TrcoAaYAZG0MsX8/FpcPXBdwplKszfXP85PU=;
        b=bLlrVi8MW9tsWIK4sX44PWo56Qk5Zmlm30bLk5Ba6szSpLqhyAdh8+D/zJYvTL0V1R
         zshn/gqfFpIpcEB52dES3kvL5RSJklq31PVXjK3kkB25y4yfBQf8TlSCfmR7db17sFjb
         ho1OyarqhusF/FeOMZzBJMdXBhS0F422jqOxtyB3+Oqrwk3HPrh0zTJvBLxmzDkPKBSs
         6tUyRL1Jd0VikjSdxTJWyo6BHYvTXWZbqc4BEpjD0b/VIOirHo+cRErCTs4Vr3yQ2SFs
         WmJz+pnKKY+w+KXBpLk8VIl1PY/jA5afV8ciEpggqsec8wlZ+MgUFnavaJoXPyOeWpT6
         s3Lg==
X-Gm-Message-State: AOJu0YzX24xw4sUbD9NMOy07lKaQgmw3u7LkS8pES2TCAKjJXbOWvkVx
	2ZXUDMW36SSB0FC1lMdjSF6iVP4kR4rwC0goRN1SZev+JPWDWO3Qrf578GfBWd5y0uLWnmDYIKG
	DYiri7Ds=
X-Gm-Gg: Acq92OEvw8fOU1Q3AoF64a5FLisdd+COZVkDx6yMLs73zH8hyJHDJPgMCelh6DezX3Z
	1hMVldV6p6/YAB361OVVkTJJ+hRl9eoFfn0ybwKGiNC0VDiN9r3UZEQwYqXzZAogqEzQQIsn9aL
	9js5BAHgF/EEaYy09zXJcQAxB43y55MMVfDpKamWQ4NgUubiqW/3p+v8b+iYoZ5P1P5mLwXz84g
	qEGJW8IIIGhhGt+RalC/LkPv0dsi1WLkYL+T200OTDt1+nQD9x3gG3B9Wokro2W8KspzFjk8xtz
	ttMxsLFAglfNEHJZCPTXo/eBtQ0fImR78FD7SCRNAzT+svuPmad8fui1q5nip/Q2Fj3WVfGmD6n
	RIbudnvniHgNPN63fP7+SyOHbhguUky67FrVJWYhLQUKCfAmb6t2TBPsJEpaRPX8pdzx/CFMaew
	xEV7C8sem3XzatKriExSzH2g6ULk65
X-Received: by 2002:a05:600c:34d4:b0:48f:e245:394e with SMTP id 5b1f17b1804b1-48fe631f631mr226307655e9.27.1779097675702;
        Mon, 18 May 2026 02:47:55 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4900c16c744sm58005165e9.3.2026.05.18.02.47.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 02:47:55 -0700 (PDT)
Message-ID: <ef5688a7-3e1d-47be-aca7-cc6e564e059c@linaro.org>
Date: Mon, 18 May 2026 10:47:53 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] tools/build: selftests: Allow versioning LLVM lld
To: sashiko-reviews@lists.linux.dev
Cc: dmitry.torokhov@gmail.com, linux-perf-users@vger.kernel.org,
 bpf@vger.kernel.org, linux-input@vger.kernel.org
References: <20260518-james-perf-llvm-version-v2-5-f12cc4f031d8@linaro.org>
 <20260518093237.90640C2BCC6@smtp.kernel.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260518093237.90640C2BCC6@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 18/05/2026 10:32 am, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Empty USE_LD variable causes clang build failure in selftests when ld.lld is not in PATH.
> --
> 
> commit 371ca22c55bb0fa6502ac06f7b33d63418ad16ff
> Author: James Clark <james.clark@linaro.org>
> 
> tools/build: selftests: Allow versioning LLVM lld
> 
> This commit adds an LLD variable to Makefile.include to allow versioning of
> LLVM's linker, keeping it consistent with the rest of the LLVM toolchain. It
> modifies the BPF selftests Makefile to resolve the full path of the linker
> using the command -v shell utility.
> 
>> diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
>> index 6ef6872adbc3e..836e783f0170e 100644
>> --- a/tools/testing/selftests/bpf/Makefile
>> +++ b/tools/testing/selftests/bpf/Makefile
> 
> [ ... ]
> 
>> @@ -245,9 +245,9 @@ $(OUTPUT)/%:%.c
>>   
>>   # LLVM's ld.lld doesn't support all the architectures, so use it only on x86
>>   ifeq ($(SRCARCH),$(filter $(SRCARCH),x86 riscv))
>> -LLD := lld
>> +USE_LD := $(shell command -v $(LLD))
> 
> Does this cause the build to fail if the toolchain directory is not in the
> system PATH?
> 
> If a user explicitly specifies the compiler using an absolute path like
> CLANG=/path/to/clang, but does not add the toolchain directory to their PATH,
> the command -v utility will return an empty string.

If they don't use LLVM= and use CLANG= with an absolute path then they 
need to set all the tools with an absolute path. That's the problem that 
setting the path with a prefix for all tools with LLVM= solved.

I suppose this could _technically_ be a regression, but so could adding 
any new build rule that added a new tool that wouldn't be set in 
someones existing build command. Being that strict would mean we can't 
ever add new tools so I don't think this is an issue. And I don't think 
there's a way to solve this and also respect the documented rules of LLVM=

> 
> This would cause USE_LD to be empty, leading to a malformed argument like
> -fuse-ld= being passed to clang later in the Makefile, which then fails with
> an invalid linker name error.
> 
> Previously, passing the hardcoded lld allowed clang to natively resolve the
> linker relative to its own binary location. Is there a way to support both
> versioned linker names and absolute compiler paths without relying entirely
> on the system PATH?
> 
> [ ... ]
> 

