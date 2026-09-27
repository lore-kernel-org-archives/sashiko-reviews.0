Received: from mta1.migadu.com (out-248.mta1.migadu.com [95.215.58.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD89E3D73
	for <sashiko-reviews@lists.linux.dev>; Sun, 27 Sep 2026 00:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790467489; cv=none; b=KMpAu+RUWMT8tO6IXKX0XPu+4Hvd1exq+jUHym7GeqoIjtL3dB9l9kdi4pffqdp9sP6J7JZHt/J1T14JyFsj/imPdOJZpxQS9wUJzfqdL5CiGmkVzYy6vZtGCniutOg1G5lkNygTbHXWYe7NvLWwbVjNJXBrSV+HRy95RMLjKwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790467489; c=relaxed/simple;
	bh=H+am7XxrcbbXNsfKwiuJY/OnXWA27or6WzF9ul/tamM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ucx7f7LAZMR4/bVYRkNqssJPBvKa9Qs09XhDQgcnUKtIVIveth88rZl/CMHXpDUcNPPjZhDA+wfjaZKVXzPF4Xv0Nc1i7fX2us+2ksom+hp934aDDwHO9FDjprXkBa5Z0eIhjINr10hkHsB3bJtUWi2Xa+Ss/dnSkxMA5sta3ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=MmgKWVtH; arc=none smtp.client-ip=95.215.58.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="MmgKWVtH"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=H+am7XxrcbbXNsfKwiuJY/OnXWA27or6WzF9ul/tamM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790467484; v=1; x=1791072284;
 b=MmgKWVtH5TGkIt/CD3LS+bJp5wgfoL7ciZdEZnlFNGkHRVrOtKe2E60uK8102rfMDySeJzKg
 0VWh4n+YodYbw8vuS+kcDYY0IrzH5+58QbJU+61kokFh8XicY9N+Rp/xIWBbD7TIG+gBua1u8my
 dOrp9mSnLL9rT/LukCcfV6rI=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 113bf3684c9f7f9f;
	Sun, 27 Sep 2026 00:04:44 +0000
X-Mizu-Trace-ID: 113bf3684c9f7f9f
X-Migadu-Flow: FLOW_OUT
Message-ID: <666ad4ef-d6e7-4c6b-b986-b562ddce3ed0@linux.dev>
Date: Sat, 26 Sep 2026 17:04:38 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v6 07/21] bpf: Resume a covered call at its
 landing pad
Content-Language: en-GB
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20260926050006.2213110-1-yonghong.song@linux.dev>
 <20260926050042.2216692-1-yonghong.song@linux.dev>
 <20260926051542.D2B111F00893@smtp.kernel.org>
 <DLP3OR7UHWTG.12NVK9OML0YZX@gmail.com>
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <DLP3OR7UHWTG.12NVK9OML0YZX@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/26/26 1:21 AM, Alexei Starovoitov wrote:
> On Sat Sep 26, 2026 at 5:15 AM UTC, sashiko-bot wrote:
>> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
>> - [High] bpf: verifier bypass of resource leaks on unwinding without pad
>> - [High] bpf: double free via bpf_unwind_resume returning to normal path in verifier
>> - [Medium] bpf: precision tracking corruption when backtracking through bpf_unwind_resume
>> - [Medium] bpf: CFG and liveness graph mismatch for bpf_unwind_resume
> These and other bot findings look real.
> Please tell your clanker to look for bugs harder.
> sashiko shouldn't be finding such severe bugs.

Indeed, missed several critical things. Ya, need ask
more hard questions for some codes...

>
> pw-bot: cr

