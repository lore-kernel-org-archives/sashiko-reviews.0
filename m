Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E342110E
	for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 05:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784179316; cv=none; b=mVX6FTEF4xXz+qpDPhHmCGfLGtzlfYGsDujmr9fYXDKxxYimdtm4LCvjHAK1mdX/ZwK5qSjpk0OZdjhp7QWG92EiqJSmf3FWVlyeWSWHjTYyoL4MEDQrU25lAhx6+9WEzdfOEPtxpCsOYxkxQGw05+TpxEZR6qfu0XH1uq6pJAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784179316; c=relaxed/simple;
	bh=/f48MDkM4JQE/WzOOxYWoZXbV433n8u1CmEsbj1vJUs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PiRhdWUMFRSuTRxfjZv41jv27K98nKDUpK9YGXPjaJiLwQroSFoxj0ZAPnJebP7oAvk7Ff2Nf6S2SHaL1FTQ+P1wHjPWyXy7W+a1DMjllv+RqvtjM7ONSyc4rtuSnQ7M01hfx0VQSpml5HnyBp0u7u3RdLGvi7apH1g6pXeNFaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kHAeWvnf; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kHAeWvnf"
Message-ID: <99de30ad-a221-42f4-b7c7-ef73f68a0116@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784179311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/f48MDkM4JQE/WzOOxYWoZXbV433n8u1CmEsbj1vJUs=;
	b=kHAeWvnf4XMFet3D14IkX6KaEqkzv1/xWkOUoz61HlxitSW9sUqWkb8DLU0XYl/sNJH2tF
	S02w16OW8PSwEGgK0Bq3/vRguTNATCJmN+4qrSg4xTZe44L5OUpcPcwli1s7RzJlZcmdmb
	WSGCGuuzpPsw9B8srlpXN82tSyf+sh8=
Date: Thu, 16 Jul 2026 13:21:46 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v10 4/9] libbpf: Add support for global percpu
 data
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20260715153254.92010-1-leon.hwang@linux.dev>
 <20260715153254.92010-5-leon.hwang@linux.dev>
 <20260715160040.A88481F000E9@smtp.kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leon Hwang <leon.hwang@linux.dev>
Content-Language: en-US
In-Reply-To: <20260715160040.A88481F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 16/7/26 00:00, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] BPF skeleton generation completely omits the `.percpu` map, breaking the promised ergonomic access.
> --
>
> --- Patch [4]: [PATCH bpf-next v10 4/9] libbpf: Add support for global percpu data ---
> (Note: The format of this review is altered to use a free-form summary rather than inline patch quoting due to automated recitation restrictions.)
>
> commit c26518c258a32645d11a26c0d0ce50242231d6a6
> Author: Leon Hwang <leon.hwang@linux.dev>
> libbpf: Add support for global percpu data
>
> This commit adds support for a new ".percpu" section in libbpf, enabling
> efficient handling of global percpu variables. It handles the section by
> creating a percpu_array map and populating it at load time.
>
> [Severity: Medium]
> The commit message mentions that users can read initialized percpu data
> after loading the program. Does the current implementation fully support
> BPF skeleton generation for this new section?
>
> In tools/lib/bpf/libbpf.c:map_is_mmapable(), the new code explicitly
> returns false when map->libbpf_type == LIBBPF_MAP_PERCPU.

map_is_mmapable() returns false for the internal percpu_array map to
avoid 'def->map_flags |= BPF_F_MMAPABLE'. But, it does not prevent
allocating mmaped memory for the internal percpu_array map.

In patch #6, the generated skeleton with this new section has been
tested well.

>
> Because PERCPU_ARRAY maps cannot be memory mapped, this prevents the
> skeleton generator from emitting the typed datasec pointer (such as
> skel->percpu).
>
> Additionally, does bpftool need a concurrent update to fully support this?
> Looking at get_map_ident() in tools/bpf/bpftool/gen.c, the sfxs[] array
> only contains ".data", ".rodata", ".bss", and ".kconfig".
>
> Without adding ".percpu" to the bpftool suffix list, it appears the skeleton
> generator will entirely omit the map from the generated header. If neither
> skel->percpu nor skel->maps.percpu is emitted, will users be forced to fall
> back to untyped manual lookups like bpf_object__find_map_by_name() instead
> of having the intended ergonomic skeleton access?
>

Hmm, Sashiko missed the map type check in get_map_ident() in patch #5.

Adding ".percpu" to the sfxs[] array is not robust, because
".percpu.data" could be translated to "data" identifier instead of
"percpu_data".

With the type check, ".percpu.data" will be translated to "percpu_data"
correctly.

Thanks,
Leon
