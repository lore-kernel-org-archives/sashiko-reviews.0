Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2C836F417
	for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 05:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154724; cv=none; b=uvXxGr9ZN35bNdTh0uKHCIODLdUV+vhMrl7+1pA79lDFv4SD4pog5ArNmHFjv3hxrBdtQgq1riObzNFNpNJy6mIxlvy8H+V89wMaPOWIvgjvVMHNIIaP0QuYFNw3ULBYVN9tw0J+CNWcXQVEmJYNfCPWaZd/Wgs4ibDpIYijIAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154724; c=relaxed/simple;
	bh=IHkpllnRQZDcX0DTmTn+wvaxGkGt2WE2obabk4MTrVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pLlpMTjeUAvaJe9N7HBbgYCK33a1eTlFcgU2RKYardpt80L3eYBlCEJT6G+5KAvQSe5eLfYJl84FqR/O+tVRZ9l8ES3LTbIsW8CwDqt956/00dZ4WzNbi3OwQkP8XLKncupaopiy70DfzALM1BiOUSuaY4ScOTdw5fBAYVhXauo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cWxPq+qE; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cWxPq+qE"
Message-ID: <6ba1e89f-e235-4d53-b447-0d42c05a9860@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781154705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RwtNPA9q+tRge9tQLpq9BQpy+zcaLUJLjfPb1GzOIqQ=;
	b=cWxPq+qElJb7FfLH4KmOH/hobLAQRmI9YftKZEVprnRbWlMOnVzKsYNsS8L4YRn73U5i24
	UgPtYY13gmNS0hcyKAZUw1Y5fcWqqnHkNuuLkM2X23V7w+DDySNFfRc3WGUZ0Z12yEnl/w
	T8EobDOO3Wsy42MZAcoFDHMncq/ZVJc=
Date: Thu, 11 Jun 2026 13:11:26 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v5 7/9] selftests/bpf: Add tests to verify
 verifier log for global percpu data
Content-Language: en-US
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20260608145113.65857-8-leon.hwang@linux.dev>
 <20260608152227.E39071F00893@smtp.kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <20260608152227.E39071F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 8/6/26 23:22, sashiko-bot@kernel.org wrote:
[...]
> 
> Could RUN_TESTS() be used directly here without wrapping it in
> test__start_subtest()?
> 

Will call test_global_percpu_data_verifier_log() without
test__start_subtest().

Thanks,
Leon

