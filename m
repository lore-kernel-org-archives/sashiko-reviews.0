Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C5C18D636
	for <sashiko-reviews@lists.linux.dev>; Sat,  4 Jul 2026 03:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783135443; cv=none; b=ceizWVR6BGySkswKvMJyh0YXAIQZJ1VyeR+XNd+1Hpwew8FScowO39IPP4Yr+Px5oSXlG2pQgVQlLRKzD/L+JM9KHi4nd9MT1/LbAKSrD8BzNNQh34Zo2BMSIqXFOEQ6Rtr7Ys5/vaN2Bc5E7jpA3mIOXP2k9euDPtiuPbO0c4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783135443; c=relaxed/simple;
	bh=+24Q2zCWN/HvGIHWklPeR2Z7HtwviKizhy/sQbZHZhc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UfZ7uf1HCdgg/xLaWbS5hpMwlyLj6SpvrPAMdw7BKcLxuwt/T/z6XEmWaSNjQsVgV3juudo+NBEpNoMJpL6IeQ6mwx4Hahwg6ezBFsem4QycuWAdcv8Sb1ITJUr+mSe0WmzBFo7a+hhaui55DQcnnxpk0RQNSDCijGnIKcrBEgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=pBHfhdLl; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="pBHfhdLl"
Message-ID: <99fe15729f88182002d4d034e12048a2a02925cf.camel@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783135438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+24Q2zCWN/HvGIHWklPeR2Z7HtwviKizhy/sQbZHZhc=;
	b=pBHfhdLljH5NS+CkPDaMpqgZ9tbZJ9h9MmsSlTLyD8n4uAmrCHvRh7hDztlnUwF+//F+h2
	JgpDBb0SBArwaKX2jgph+Grr6wHsLe8betAnJYoBT8BA78ZjimWD2Tnr8jVH0HEHaI50As
	DYGwtfIPEWkRasLw5pPF5RGv7nObVGc=
Subject: Re: [PATCH bpf-next v7 1/2] bpf: Introduce jit_required flag and
 refactor kfunc path
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: KaFai Wan <kafai.wan@linux.dev>
To: Tiezhu Yang <yangtiezhu@loongson.cn>, sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>
Date: Sat, 04 Jul 2026 11:23:52 +0800
In-Reply-To: <7d326e51-976c-2962-aa01-a545e2f64259@loongson.cn>
References: <20260702143656.28845-1-yangtiezhu@loongson.cn>
	 <20260702143656.28845-2-yangtiezhu@loongson.cn>
	 <20260702145855.07C6B1F000E9@smtp.kernel.org>
	 <7cce1695-eaa2-816b-2877-9cb2f117aa27@loongson.cn>
	 <4a0ac2692d2a76ab0479c2bf20dbf26a17636d67.camel@linux.dev>
	 <7d326e51-976c-2962-aa01-a545e2f64259@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT

On Fri, 2026-07-03 at 23:56 +0800, Tiezhu Yang wrote:
> On 7/3/26 21:51, KaFai Wan wrote:
> >=20
> > Was it tested after compiling together with patch #2? seems patch #2 wo=
rks.
>=20
> Yes.
>=20
> >=20
works as expected.

--=20
Thanks,
KaFai
