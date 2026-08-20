Received: from mail-24429.protonmail.ch (mail-24429.protonmail.ch [109.224.244.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE6D221D89
	for <sashiko-reviews@lists.linux.dev>; Thu, 20 Aug 2026 14:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787236261; cv=none; b=L3aWzKD1+JIBVWFnssjKX9MeX9+PIcWTWjnY1+r1E4wwiC4DexDxhH6rD6DOpKELn0rWxC5JKx+ZzMH/yCx5ZXb5DyWc39UodFMynxCnZPq/wtwDWd1ciUR1fdmrUNtO9dF0xmXeWNXx/rt+y5Z0ZRMJl/mUWbVdYrrPRbmdHf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787236261; c=relaxed/simple;
	bh=6nZekrGDR1e79cZp3d5jjVTk/CDtiCrwQg6z8O9+w08=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RL0xAQMbUca3EnWN4iXKUMB/khJOPSiYe4ESN3S0cpqZtIsC9mLmpjMt7g2zJUvTzOshE5BV6RuIsPwlAHI//8OpuQrO1SjTgaFPoDFt7cS4QoSfsK24O0NwJ1PdRPJ1z/O7ImP7ViQju9MwmqvjTPqIbAstp6JaHHqWtr/Tr98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=R7WaDDj4; arc=none smtp.client-ip=109.224.244.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="R7WaDDj4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=bev6y25i6ncctedy32ymibrkma.protonmail; t=1787236253; x=1787495453;
	bh=6nZekrGDR1e79cZp3d5jjVTk/CDtiCrwQg6z8O9+w08=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=R7WaDDj4uDWfaqWgvp9hz3zmu3Ei0TOFlLNWcdXx8Dh9w4wKgoWIPW+cHVI8nfzUN
	 fH/AETksbKuyd7FGPgCilPREML61oZWoTNrA2yDzaQnXSPJ3h9tFa0UaHT5i81Tdfp
	 0kfPCHvHjbhNKN6J/+X4AvV/pUJzlU1botcUUUXvF7AE9C6LYbAd59RNuwVBQlrwUu
	 mPdarLyk9qH6uCBIXUVJZSv86f/l7u21NB60CuZLrqJNgJ9ov4YPh0ki3+bPBfVtK7
	 ZxJwr/09bSCRRjeeSwzV+4hQA0R/nqLy9Bc+0+qDntN7+3b8xJfX2etaBmXJi35PNG
	 F1oG25mCT0DAg==
Date: Thu, 20 Aug 2026 14:30:50 +0000
To: sashiko-reviews@lists.linux.dev
From: quanyeyang <quanyeyang@proton.me>
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH v2] bpf: Annotate bpf_obj_memcpy with data_race
Message-ID: <dxXTVwpQO7zo4ivW09N7H3v1-xi5XFS2KuY6EG17YJ7MdY5GLbHDXcG-8P3NYOKJHqkEUL8PEUwFX1nCVirLeNXR7y-MBLcx9WfAdt621Rg=@proton.me>
In-Reply-To: <20260820112634.EC5881F000E9@smtp.kernel.org>
References: <20260820-bpf-kcsan-obj-memcpy-v2-1-672517a3145f@proton.me> <20260820112634.EC5881F000E9@smtp.kernel.org>
Feedback-ID: 206494642:user:proton
X-Pm-Message-ID: 579cd2722e5d9fed5952d59023485ccda98b5b71
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable





Sent with Proton Mail secure email.

On Thursday, August 20th, 2026 at PM 7:26, sashiko-bot@kernel.org <sashiko-=
bot@kernel.org> wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>=20
> Pre-existing issues:
> - [High] bpf_obj_memcpy() ignores the long_memcpy parameter when a map va=
lue contains special BTF fields (rec !=3D NULL), leading to data tearing an=
d uninitialized memory leaks.
> --
>=20
> --- Patch [1]: [PATCH v2] bpf: Annotate bpf_obj_memcpy with data_race ---
> commit 1f96f25bd23990e4a6c598225059cbcbac9898bf
> Author: quanyeyang <quanyeyang@proton.me>
>=20
> bpf: Annotate bpf_obj_memcpy with data_race
>=20
> This patch annotates the ordinary memcpy() sites in bpf_obj_memcpy() with
> data_race(), matching bpf_long_memcpy(). This documents the existing
> concurrency semantics and suppresses KCSAN reports for intentional races
> without changing behavior.

Thanks for the review.

The per-CPU padding issue is pre-existing and has already been fixed by
commit 7cf9cd98cf6f ("bpf: Copy per-CPU map value padding in
copy_map_value_long()"):

https://lore.kernel.org/bpf/20260624155115.85196-2-leon.hwang@linux.dev/

That commit makes copy_map_value_long() pass
round_up(map->value_size, 8) to bpf_obj_memcpy(), ensuring that the tail
padding is copied even when map->record is non-NULL.

My v2 was based on a Linus-tree commit that does not yet contain this
BPF-tree fix. The data_race() annotations neither introduce nor change
the padding behavior. I will make sure that the next revision is rebased
onto the current bpf tree.

As for tearing, bpf_long_memcpy() provides only a best-effort mitigation,
rather than a strict anti-tearing guarantee. The syzbot update paths
addressed by this patch use copy_map_value(), not copy_map_value_long().

quanyeyang

