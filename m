Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805B62C326D
	for <sashiko-reviews@lists.linux.dev>; Fri,  7 Aug 2026 02:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786069654; cv=none; b=OeJ5p4p1Xmu53XdSY8Ll8Vc1YXeYw3cfDZaYkpew3LPVFoftYEj9Kdy3Xm5E6QB0HzIli9GpAtSwyN7l9VZ46laHpXQMSir/SzvshQ4AYBqgTV8TovwXY/z9N2W5887aShECGVIUiOM+2+xdLVQeQ+Qa7oQ2CXqeK8HvBSQJdZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786069654; c=relaxed/simple;
	bh=VMhNnNtC58bXXuBnAd0obFINl8i361Yt/8Yq4tjSKPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J93Jt+QeLKspLIDa+RDTQPxS8WFI19F0w0o+eWan/iBYHUnQIUoUccIi3k6Kwu0Z1r0HTqE9C3xMm6cj4CQb2Wq5i24PkIh+JJx9ZNrjEX+1YfYeC3CCqicl0RouW041Z+U647d8VE2Xd0vxzWs9xyLQoWgyYVTucWXdvYWy7wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qjz2laVJ; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qjz2laVJ"
Message-ID: <4411dd33-bc55-48cd-92f2-abdc2746bf64@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786069649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uzH/F/uHtyeWEg8zC2Wi2kDM6l58zcVHBNbhZ42TgZk=;
	b=qjz2laVJy0FNk2hONGZIuCdfLtHRzi5XUqLKLO9oYFUBxn0qT8XF/GY0arnZ2BRmQCSxVd
	yew/Bx+Lj20C1gDKpppC4CYOD32Q0TICsAslWRayBaB5o69LoyjnL/7oAMTV1X/J+vDSkG
	BN2MTrmOPfi6F89cOvx0zU9Wkif/3LM=
Date: Fri, 7 Aug 2026 10:26:58 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v11 04/10] libbpf: Probe percpu data feature
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20260806163125.11172-1-leon.hwang@linux.dev>
 <20260806163125.11172-5-leon.hwang@linux.dev>
 <20260806170543.EC13F1F00A3A@smtp.kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <20260806170543.EC13F1F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 7/8/26 01:05, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The newly added feature probe `FEAT_PERCPU_DATA` is never used to make capability decisions.
> --
> 
> --- Patch [4]: [PATCH bpf-next v11 04/10] libbpf: Probe percpu data feature ---
> commit 925264284b89c241360ff401bd914f9c19997613
> Author: Leon Hwang <leon.hwang@linux.dev>
> 
> libbpf: Probe percpu data feature
> 
> This commit adds a feature probe to detect if the kernel supports global
> percpu data. It aims to allow libbpf to fail predictably when this feature
> is unavailable on older kernels.
> 
>> diff --git a/tools/lib/bpf/features.c b/tools/lib/bpf/features.c
>> index b7e388f99d0bb..ef9581c113035 100644
>> --- a/tools/lib/bpf/features.c
>> +++ b/tools/lib/bpf/features.c
> [ ... ]
>> @@ -707,6 +739,9 @@ static struct kern_feature_desc {
>>  	[FEAT_BPF_SYSCALL_COMMON_ATTRS] = {
>>  		"BPF syscall common attributes support", probe_bpf_syscall_common_attrs,
>>  	},
>> +	[FEAT_PERCPU_DATA] = {
>> +		"kernel supports percpu data", probe_kern_percpu_data,
>> +	},
>>  };
> 
> [Severity: Medium]
> Are there any callers that actually query this new feature probe?
> 
> The commit message notes that libbpf can make capability decisions early
> and fail predictably when global percpu data is unavailable. However,
> FEAT_PERCPU_DATA appears to only be defined and registered, without being
> queried in the loader code.
> 
> Is there a missing update to the loader, perhaps using kernel_supports(),
> that checks this flag before attempting to load percpu global data?
> 

No. The loader checks this flag in the next commit. The selftests also
check this flag to decide whether to run.

Thanks,
Leon

