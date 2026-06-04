Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024ED477E42
	for <sashiko-reviews@lists.linux.dev>; Thu,  4 Jun 2026 12:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780576797; cv=none; b=PvkjRGebqBjjAODRYNcDIX1qCz/bEvFWAKst9OH2aoPnwtulFi/9udpV7i+PL3yX/YeyZ3MzK2w99tPm9YAmKKyZu53IaAdHriPiiebAjMSU8aBAkgJPMsPrlCNx9xyFaIIPT3bjaFYsTn1aKkWLTA/XOEpByiskajnz4SzDriw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780576797; c=relaxed/simple;
	bh=bDJguCkQLLEVAS3+KgmsIucEJ00auEy2Aimrtm0hg9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bjgDXkKNupCz9/RLBGY8/E/sUPRTswfHkvBaslrQwHr9GGsAzoTCz7QWcXedhqbz+cJWtkiJp+Q45LPOBQxNziztmMfngqG1GYP4Rr2hSFJOpGCLHbVmAjwzFTzonSOmAumprWUGbIh2nkoNvfCopQa3kTBc4MgFuDTXQZIvMDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dFo14rsc; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dFo14rsc"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-bdb3fd39045so82915266b.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 04 Jun 2026 05:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780576791; x=1781181591; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tfTI7/RaplkjxzTEP61bDmxIdxLiQtWWBRo1PzCRK/Y=;
        b=dFo14rscaS7HCWU3fS8Q7oP/Nw83mLOid2Be/HLwoaGeCEKNwSZAdWW9oQTsQRm6a4
         GuDP6au3azSRfHYQLuqm6EiAya1INm1xwuv7oOa1IJ1TpEKlVxImlMpszBmFnvu7AvPU
         srXbWVbYIBY8hiDKKgJ49UCgoBkiJ9lBNeN904Qzo3OPViXDEJUF+dOGcEf8T6/1ebYC
         ZuRREkQ4KTfCPaLXs9wNi/m25fnt2iAC0ogX0o5luuuNdz9NLpfMpY1xHhwS/kJlNs1+
         QFFQufTxC0Ds3QqLIilg7ikzaCr2327MlICcBDk4YCaLMCOcbiJf73wYCw3OqPJnyOBn
         vqIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780576791; x=1781181591;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tfTI7/RaplkjxzTEP61bDmxIdxLiQtWWBRo1PzCRK/Y=;
        b=gJ1ch9OomQkeJBDm/FTLQ84pQkdjOo0iSl21+f+6d61gwSIk33Lmt6tsORksFgiPh1
         qtdoHr412SA++Oqn7vP7+EkxJwiWFxVD/5NxpLqs8TCbzLTlUjPdgUNDcLJmyx72A4n/
         gV5UnhZG3E22VX+GL4hqzQzq2jaNL0uKBIMMvzgpha0Cd53PlwCP+lOlkKgHE8aIq11t
         pllLBPGEjY7U3Axq8QxXs4DcmBLuxtZLdxvUiMmfrOVQ/D8JDR+JcQFehX/sfg1PojTg
         1O6SwIp85ljVjRwnYp9L8OfgZpa+tksgR5QM6SYZCUUgkNMVJzhKavjSru5iDS0pohvU
         LP8g==
X-Gm-Message-State: AOJu0YzazXUUpvlZNPP4U7k6Bqwyi8i3t25xru4NbuAo3mRXtSKIt32V
	KM+SE0ibk74jSdOwpImHdyQroojqejXBOfbMPHbTCmHLrjyw7TcDy2XdhaT0n9hqxOoPPhPzDFS
	bIllPzGM=
X-Gm-Gg: Acq92OG5Adxhzlz+UyJErVL6ruDliuKjjHpUCN2YM4EbOgWsE2dLi/1ctaUzp/F4PnK
	EqY+0Dz6h1O2nlpicyDobigq0BvUvWRaqaFgS1GyPyrSPvJRgOfrwV5qmOemycVH8bzglxzFM9+
	45t+wD4qbXcFWONR9ngQ3XWzOVj9cEPCR/8MG8MW2bBF+Kq4uPx6WhZlq16LGLHVO/Iay0p0I3D
	Wg3JRo3pZtAMx9oF/UP/XnJ9YaMqLRuElzjdq5WrrkeiCgpkYiHxf8ueAQfd8abcWNfFi+1ZQqw
	ZNr/JNeaZl2PD7rA3e55foj68jSdG5B7dCnsXDgNFkXa/xTLoa+wINlJ/EMOiG8nSH46jGCr2R3
	fg551Flw5uNq+CMbh+5fPZRhZ5+uojr3Occ7GYYZc/qdSraHVGgms6Bbyc6XsdgyvaAJ/vBi7zg
	ZDQ/0rBd6oWyXC5CYJTfFTHfZuuSTfvUnqE89e8cE=
X-Received: by 2002:a17:906:4597:b0:bd5:2859:ed0a with SMTP id a640c23a62f3a-bf0af60a732mr277844766b.42.1780576791060;
        Thu, 04 Jun 2026 05:39:51 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46028a6dce6sm7660350f8f.30.2026.06.04.05.39.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 05:39:50 -0700 (PDT)
Message-ID: <d4471acf-207e-4426-a1b9-a17ce14241b1@linaro.org>
Date: Thu, 4 Jun 2026 13:39:49 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/19] perf test: Add a workload that forces context
 switches
To: sashiko-reviews@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org
References: <20260603-james-cs-context-tracking-fix-v3-3-c392945d9ed5@linaro.org>
 <20260603102817.EFB021F00893@smtp.kernel.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260603102817.EFB021F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03/06/2026 11:28 am, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Calling exit(1) on I/O failure in the parent process abruptly terminates the test wrapper and bypasses workload control cleanup.
> --
> 
> commit 4bc96eb1d44f39f8252cd4bbe7f402600bc7ca26
> Author: James Clark <james.clark@linaro.org>
> 
> perf test: Add a workload that forces context switches
> 
> This workload launches two processes that block when reading and writing
> to each other forcing the other process to be scheduled for each
> read/write pair.
> 
>> diff --git a/tools/perf/tests/workloads/context_switch_loop.c b/tools/perf/tests/workloads/context_switch_loop.c
>> new file mode 100644
>> index 0000000000000..173d770ae6192
>> --- /dev/null
>> +++ b/tools/perf/tests/workloads/context_switch_loop.c
>> @@ -0,0 +1,101 @@
> 
> [ ... ]
> 
>> +#define write_block(fd) \
>> +	do { \
>> +		if (write(fd, &buf, 1) <= 0) \
>> +			exit(1); \
>> +	} while (0)
>> +
>> +#define read_block(fd) \
>> +	do { \
>> +		if (read(fd, &buf, 1) <= 0) \
>> +			exit(1); \
>> +	} while (0)
> 
> [ ... ]
> 
>> +	if (!proc1_pid) {
>> +		close(a_to_b[0]);
>> +		close(b_to_a[1]);
>> +		prctl(PR_SET_NAME, "proc1", 0, 0, 0);
>> +		context_switch_loop_proc1(b_to_a[0], a_to_b[1]);
>> +		close(a_to_b[1]);
>> +		close(b_to_a[0]);
>> +		exit(0);
>> +	}
>> +
>> +	close(a_to_b[1]);
>> +	close(b_to_a[0]);
>> +	prctl(PR_SET_NAME, "proc2", 0, 0, 0);
>> +	context_switch_loop_proc2(a_to_b[0], b_to_a[1]);
> 
> [Severity: Medium]
> Since context_switch_loop_proc2() runs in the parent process, does calling
> exit(1) on I/O failures abruptly terminate the entire perf test wrapper?
> 
> If write_block() or read_block() encounter an error like EINTR, they call
> exit(1) directly. Because context_switch_loop_proc2() is executed in the main
> process rather than a forked child, this bypasses the workload control cleanup
> in run_workload().
> 
> Should the parent process return an error code instead of calling exit(1) so
> perf test can clean up gracefully?
> 

Will fix.

>> +	close(a_to_b[0]);
>> +	close(b_to_a[1]);
>> +
>> +	if (waitpid(proc1_pid, &status, 0) != proc1_pid || !WIFEXITED(status) ||
>> +	    WEXITSTATUS(status))
>> +		return 1;
>> +
>> +	return 0;
>> +}
> 

