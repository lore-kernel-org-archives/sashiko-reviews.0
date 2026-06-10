Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFEB37AA7F
	for <sashiko-reviews@lists.linux.dev>; Wed, 10 Jun 2026 09:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781085079; cv=none; b=dEEq8wLB6VrZWyM1Zf0vK/pnyXygPDxtetktRb2OFRTiNaovjnoCQxTMdAgaQ4WL8fYY78UUZNU8hwZQqVayFzxhLjwgbWUfZK6wYZktpR3ZgqHL6XOFutnIFl589t1ddnpN+aEzbEL9gcpWMobYW2tGOeVUfRSy5NmQBDdFTco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781085079; c=relaxed/simple;
	bh=pKA7DpH46SjVAcJNqrwdZ4g9oy71Af6s+blMUhkRXPA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P58lpjl59cSlfwu08J4KgS8b0Uxw8qoTcMZQmarCbTAbuKKeoABjgjMO/TUFKWq5bn9ENUxqiqClBfiH02BZ42p/7t1NVI5AnSnNmJt73fasK4TQljQNdNr/Gw0Sv7aYc9t88CmEREmZrCp/xk00SjRNtkPlvxAEpzcWan1XXjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bRsTw2yL; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bRsTw2yL"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6919f40a0c8so7041995a12.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 10 Jun 2026 02:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781085077; x=1781689877; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VE3z35ezp2x26/gLg2UFK03+neYzzdYMzs/N6bRl8v0=;
        b=bRsTw2yLNEl2WsGlhRrzf5X0L3GMytv+Vst0qv9sc1qWimMFv09FjINXXeoSRc9n9G
         2uuB685liQjn2irb7xfMo5oLAFjfINE0jSTc5mt9rYueVUtvC7acOvUVZqrdfkLhplv/
         dq6V2vq1X1jpYBGlaUCfTB/fF1mkuATtvTuwWTcJAB95i/zfvR8mzVX4CxmYoKC4Uxdn
         7cGozjrU1B7gHpe5luO/Zztp9+LEdGBvxy2M03p9lePkF0uYbUcKGC3fKDP5gDOyKJuX
         mHlrElPftIanSCszBTnDYnImNv2/f6MLvcZNtSgbeL7aJ9aQ2MhcF1GEt+kLvE+GBUyN
         09Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781085077; x=1781689877;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VE3z35ezp2x26/gLg2UFK03+neYzzdYMzs/N6bRl8v0=;
        b=rXhEdi+ATfIMd1bjALTan2oEVBYkBAUol8BdBqOYBxc5T2uHWrHd4qUC2ffPsndaMI
         jDGo5rUTm4kPetfo51pKY6DgV3+FfzBX6SU+nwMV/DEpxPUEN5YCsvD4j3WN33//T6Td
         Xun9s/kZxCGrhD0XDHV54/q9Gp44qGzZKbsdrDRFpSmKoelvNAK3g+EYaAPIg2NF0OEz
         U+dcov8w5WbvIbnA7LmrpJpMLJf8844WB+GvFboNBsxi0v+O28z+u49InNE2D6p+Abnu
         sbvl6mxOiS88DutgCuDVhSrkycn19kGjznFH4r2vSutGSzTfNHEVDnMCCBjG2swdglRX
         83pQ==
X-Gm-Message-State: AOJu0Yy6GENSOkcuSO6pEZDjlWQoS3m2p4tDqdV5xMh3DviCAWJ7b0At
	YVDIUuSEiflr1j/J4xAfr/n0Q+acp9ATW/5lpSd2SQYYKks4s3LmPMTLV3enQB7Vh09T8qaZFsz
	3L69iqiY=
X-Gm-Gg: Acq92OHJXWjaeE+fuCNjcfmsx8SyhfrbJjzAnItRc4PxvLlXlkIMdO95vygbLSTFdun
	ERfqIKk4tWUKq1VD7YRoCN0dqoVWc7aoMggB8YUJzHdlIkN/cgXky1Dq1H1HVyfLGxUYw5THbrW
	J382QL+udRUjJmVvaObjTZrfWuMRWrY6PXMmdMwzO2Y2/VEczwRXzoRnxzGUxhseu9wtIiLi2zk
	kqDzxKXK98JUseAvuUcBOn6e3ntBIIQBnynhtiYUF7DYYAEQ7XUDSVc5GKr+vbg6opa3wmz1a/4
	MMd4kJeXMbdOPq/esgCvG9rtO2qL2/a9G73gA96S+hSPdfWTYhHZz/Iac5DZrQn6umKz0fpw0Ok
	+S31b92Rcm3TwxdHzQoMKTiqTI5YqKgers0Wj5WIc71+j6sosD5dqAg//VR6/lxpjEo7EY2CJ6o
	k8lJ0EZefBEO6aacNIkYldi8dBbuh3bhJ5FAfpJJQGp2v0kOZ2eQ==
X-Received: by 2002:a17:907:3f14:b0:bed:a7d7:82c8 with SMTP id a640c23a62f3a-bf3737eebd6mr1303429866b.37.1781085076640;
        Wed, 10 Jun 2026 02:51:16 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0517721e5sm1176091666b.9.2026.06.10.02.51.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 02:51:16 -0700 (PDT)
Message-ID: <be7c5ecc-3fe4-4eff-a850-132a2be89753@linaro.org>
Date: Wed, 10 Jun 2026 10:51:15 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/19] perf test: Add workload-ctl option
To: sashiko-reviews@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org
References: <20260609-james-cs-context-tracking-fix-v4-2-44f9fb9e5c42@linaro.org>
 <20260609144018.2D77E1F00893@smtp.kernel.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260609144018.2D77E1F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 09/06/2026 3:40 pm, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The commit message claims to add a `--workload-ctl` option, but the implementation actually adds a `--record-ctl` option.
> --
> 
> commit be5e10b3228f286fe50c54ca1ba231a4a933afc1
> Author: James Clark <james.clark@linaro.org>
> 
> perf test: Add workload-ctl option
> 
> This commit adds an option to 'perf test' to open a named FIFO and send
> enable and disable commands before and after invoking a builtin workload.
> This allows syncing with a 'perf record' session to limit the recording
> scope.
> 
>> perf test: Add workload-ctl option
>>
>> Add a --workload-ctl=fifo:ctl-fifo[,ack-fifo] option for 'perf test
>> -w'.
> 
> [Severity: Medium]
> This isn't a bug in the code, but there is a mismatch between the commit
> message and the implemented option. The commit title and message specify
> '--workload-ctl', but the documentation and code implement '--record-ctl'.
> 
> Could the commit message be updated to match the implementation, or should
> the option be renamed to '--workload-ctl' in the code?
> 

Will fix.

>> diff --git a/tools/perf/tests/builtin-test.c b/tools/perf/tests/builtin-test.c
>> --- a/tools/perf/tests/builtin-test.c
>> +++ b/tools/perf/tests/builtin-test.c
> [ ... ]
>> @@ -1486,6 +1664,8 @@ int cmd_test(int argc, const char **argv)
>>   	OPT_UINTEGER('r', "runs-per-test", &runs_per_test,
>>   		     "Run each test the given number of times, default 1"),
>>   	OPT_STRING('w', "workload", &workload, "work", "workload to run for testing, use '--list-workloads' to list the available ones."),
>> +	OPT_STRING(0, "record-ctl", &workload_control, "fifo:ctl-fifo[,ack-fifo]",
>> +		   "Write enable to the fifo just before running the workload and disable after, with optional ack from ack-fifo"),
> 
> [Severity: Medium]
> This is where the option is defined as "record-ctl" in cmd_test() instead
> of the promised "workload-ctl". Does this option name need to be updated?
> 

