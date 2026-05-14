Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F023E3F0A8D
	for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 14:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778768717; cv=none; b=lVocq/MUk/yZV4tNOpUw7OxKDot7s38ZXjyzy6pX1SIsq/R0lLB6/0cUw0jq0CydsiWLV9IXRWpzkwOrRImz+YvBhkCRGsR5PLaIApmCGuAAuLsUlnn6550Fiu1gU/W1soSRi79V2qYrqxep8H+BcKlGQihJHgAP7nUinbY0A0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778768717; c=relaxed/simple;
	bh=EiLN33Wee9QpQaiGsEREuM9Biwzc2UtCxY/1KMhYybE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CFp59eZEkWXm5etil1vQbs/fUJAMtyYv8fMx7pq3ekYU5yLCK/HcNyCrw0l6jNzo60UWlMjPc+geKQXNgkCjS5LFUvDAKjG9WZ5GLg/QL6MLaowZNuW/QYpV48HSoIFk2oen82BgVb+qi2cjbN2TYisAPvVNcJGlMcrB6cQ6bTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=KwA+iDXt; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="KwA+iDXt"
Message-ID: <eae54df8-e589-4182-8c4f-5f14a8de904e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778768712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4jhU9cGtB7EzUBav+wq1QMYINnOCYr1qT79kzFONspQ=;
	b=KwA+iDXt0Vh5/NEPwC1cPunFFomLOfl4uxftccBt3gq9p+npQzy5YlacWQHpTAsGPSDJ89
	Hos/H5kDi8SnBcy34BdAOEGU7+1mmvWiTY0E9OZkC/xhWY0w8/irpAQYY7nCvevlApsYwP
	4+vWeiuyonKzmc19oYYIbYmKEY4+HVc=
Date: Thu, 14 May 2026 22:25:07 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v14 6/8] bpf: Add syscall common attributes
 support for map_create
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20260512153157.28382-7-leon.hwang@linux.dev>
 <20260514004634.3DA09C19425@smtp.kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <20260514004634.3DA09C19425@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 2026/5/14 08:46, sashiko-bot@kernel.org wrote:
[...]
>> +
>> +	err = __map_create(attr, uattr, log);
>> +
>> +	/* preserve original error even if log finalization is successful */
>> +	ret = bpf_log_attr_finalize(&attr_log, log);
>> +	if (ret) {
>> +		if (err >= 0)
>> +			close_fd(err);
> 
> Since __map_create() has already successfully created the map and installed
> the file descriptor via fd_install(), the fd is globally visible to the
> process at this point.
> 
> If bpf_log_attr_finalize() fails (for example, due to an invalid pointer
> for log_true_size), we attempt to roll back by calling close_fd(err) and
> returning an error.
> 
> Could this race with a concurrent thread?
> 
> If another thread closes this fd and opens a new file between fd_install()
> and this close_fd() call, wouldn't we erroneously close an unrelated file?
> 
> Also, if another thread dups the fd before we close it, wouldn't the BPF
> map remain alive and accessible to userspace even though the map_create
> syscall returned a failure?
> 

Replied in v13
https://lore.kernel.org/bpf/3c9b4ff0-7a62-4053-83c7-23151905c742@linux.dev/.

Thanks,
Leon

[...]

