Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F185523741
	for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 14:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778767204; cv=none; b=il2f2ba8jOR9GJvaUMK20UE2vFUszoneVy72k8FidyU4zrx5BBvfB6yDzn70YRHIgB2pOzBmErlUnTUpDDHEwO1GrFYD/4XZiGdyx8sAOSaFk2fOGaSCAl5Gs7FrMul4+JAnytlRoMFySqS33wFgrE/VCvVQUpUaJS+DRKARD6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778767204; c=relaxed/simple;
	bh=o5gs3QweK6KBu4zkESUN9znGN7X7SJbubbxfZQvUgts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ToOntjPxGi1z4GK7CVZlX7mQitTM2O7QIICa4ETwu2gCPaDKLp5nYxW3B7DLDqgQNLCXjfm3VRJI/4L3vDS0Lybalkl2n0Q7smHNFAZed1EAwZvFy8SXxUf7PiK0GRhet5UGazvR/1Ej86S6MprN98s5soyGGqFLCuYYHqd/Ptw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=G7dNJlO0; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="G7dNJlO0"
Message-ID: <4d881d12-ac2e-4b62-9281-7b308d3e6cbe@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778767201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sSb7c+sc2btMTrdElpIA5GQxn5URAM5o2dXqJrcb5mU=;
	b=G7dNJlO0NzYGMHBm/ZzULrR+Ui4E65rQYqYcsiXc66rfcYmEkWEy5fOxeMhO3tyvohx/p1
	Hj9t1H9dkNe7L8p9hpz0QLNJ6kPQKpmD+77Zt1LTaP205gambEiwSpWMH48gBwYYRnx4ix
	IpB95/AJkwl1MN4MnsOebfPWBbKUB5U=
Date: Thu, 14 May 2026 21:59:53 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v13 8/8] selftests/bpf: Add tests to verify map
 create failure log
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, bpf <bpf@vger.kernel.org>
References: <20260511152817.89191-9-leon.hwang@linux.dev>
 <20260513003358.55836C2BCB0@smtp.kernel.org>
 <b22790b4-1e33-4cab-bc2f-92cf7fd60bfd@linux.dev>
 <CAADnVQJk4WRFrwfNAgmFSbS1AgBHUok48ArU08SwSn32GNwbWQ@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <CAADnVQJk4WRFrwfNAgmFSbS1AgBHUok48ArU08SwSn32GNwbWQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 2026/5/14 00:58, Alexei Starovoitov wrote:
> On Wed, May 13, 2026 at 3:47 AM Leon Hwang <leon.hwang@linux.dev> wrote:
>>
>> On 13/5/26 08:33, sashiko-bot@kernel.org wrote:
>> [...]
>>>> +static void test_invalid_numa_node(void)
>>>> +{
>>>> +    const char *msg = "Invalid numa_node.\n";
>>>> +    LIBBPF_OPTS(bpf_map_create_opts, opts,
>>>> +                .map_flags = BPF_F_NUMA_NODE,
>>>> +                .numa_node = 0xFF,
>>>
>>> Is it possible for this test to fail spuriously on large systems? If the
>>> test runs on a machine with 256 or more NUMA nodes where node 255 is
>>> online, the kernel validation will pass.
>>>
>>> The map creation might then fail for another reason, skipping the expected
>>> log message and causing the test to fail.
>>>
>>> Would a value like 0xFFFFFFFE (avoiding NUMA_NO_NODE) be more reliable to
>>> ensure it exceeds nr_node_ids?
>>>
>>
>> Practically, NUMA nodes number wouldn't be >=255.
>>
>> Instead of 0xFFFFFFFE, better to get possible numa node number from
>> /sys/devices/system/node/possible, like libbpf_num_possible_cpus() to
>> get possible cpu number.
> 
> Ignore this bit. There won't be such numa nodes any time soon.

Get it.

Thanks,
Leon


