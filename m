Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF62341AC7
	for <sashiko-reviews@lists.linux.dev>; Mon,  1 Jun 2026 07:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780300060; cv=none; b=W8x0+za1cGGNS29nuF93a1SeJl9yKbpV3yALwlEtJdlK21k75Z2EJosKesKysFMXSWyK4Z+QWpLHnG5hYb9/7/MfxS4ErZXJN6fqdLVieaVa6LuOIMoATIZ2ahU7nESJfN+aK4LKLSQI0SoUU7erTDgBVQifZ/c3jBBdEfS4a7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780300060; c=relaxed/simple;
	bh=3otQ+6lx0LIlkHarxdUeqFFkUzEFZ3jonGFusK2y6wk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ewaHjL04whXOl0xKQCIa9TIIypa0NlRXLvCPwqEhem7XUaQXnGJxOxjIs9ZYGACI3xs1L3A7y/zmc7UE2mC31apEBrIe6wweiZTy7qkpyzgRzNxvrOWKtW0ch4vzx5EGXqz4BgsKdYqrBDp6V45chwbsMdKqvIeFtbIGfyfMSLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fFn6IdGX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fFn6IdGX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5816A1F00893
	for <sashiko-reviews@lists.linux.dev>; Mon,  1 Jun 2026 07:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780300059;
	bh=3otQ+6lx0LIlkHarxdUeqFFkUzEFZ3jonGFusK2y6wk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fFn6IdGXtqBh65YZr7vHq8tevdnO8xb3YOpLHwlp5wvvlEojCIo1Bm1Lgcxu2zHnP
	 GH8WSlWnNrWmFgmDv1cYW1ROCg+UpAqLyFdt2Rp56godxQwZkobqKUY9DZAk5u9o+e
	 TPtkg+vIB48NHvgc7l8q8mBczplfnX99mL+3zPjb0bqJTYkF6xehyBUlEnmeSrdr5O
	 PsH0X3ndS+sio6V8nRL6SUtFvwNCQm4OKCQoy9MAjpPo2HIS0KXFaKpP8hHnbbGQDx
	 Tc/aHyoq7YZ/WfDaQVOAlp0Fov16g4UOqr4LEsYmjxU83cHUx2z6EtzDeEr3XmqoXJ
	 bvCrCBrOjje0A==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-396779b9a7fso9824451fa.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 01 Jun 2026 00:47:39 -0700 (PDT)
X-Gm-Message-State: AOJu0Yztpa+jR3xDy2CNi4aw+zDYSjrOl+M0ir/aWu8zrPaKDsRgZAsD
	1wX2fF5o5irn7cpfhBvHMbPAylHI4FjtZ5/LqxBiB37kEHXwrLwIKEF+KZLEiAUYvr37X3CGlpS
	mOxWE7WFbplllxws3CcW81UIvJNIULLE=
X-Received: by 2002:a05:6512:3408:b0:5a8:6e64:a932 with SMTP id
 2adb3069b0e04-5aa6092a8b2mr2385807e87.32.1780300058183; Mon, 01 Jun 2026
 00:47:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260526-ks8995-to-ksz8-v3-3-c530f651989f@kernel.org> <20260530004901.49E6C1F00898@smtp.kernel.org>
In-Reply-To: <20260530004901.49E6C1F00898@smtp.kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 1 Jun 2026 09:47:25 +0200
X-Gmail-Original-Message-ID: <CAD++jLn8LD9nnUg4emLDLJ7vdF5x1gOZzowfnsui+KCjTVEUew@mail.gmail.com>
X-Gm-Features: AVHnY4I_QNw0zp6cDiRvPt5b7n7lRo9hnRLNZARX2oVoeKTsNHzV3n9mlUsOsLQ
Message-ID: <CAD++jLn8LD9nnUg4emLDLJ7vdF5x1gOZzowfnsui+KCjTVEUew@mail.gmail.com>
Subject: Re: [PATCH net-next v3 3/5] net: dsa: tag_ks8995: Add the KS8995 tag handling
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 30, 2026 at 2:49=E2=80=AFAM <sashiko-bot@kernel.org> wrote:

> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s) to consider:
> - [High] Double free in ks8995_xmit() error path when vlan_insert_tag() f=
ails.
> - [High] Double free in ks8995_rcv() error path when skb_vlan_untag() fai=
ls.
> - [High] Undefined behavior from ilog2(0) when receiving standard 802.1Q =
frames.
> - [High] Failure to push non-802.1Q hardware-accelerated VLAN tags into t=
he payload.

I have already looked at this.

Sashiko is missing context, in this case comparing this code to
other taggers in net/dsa/tag_* and realizing this tagger is doing
exactly what other taggers do.

If there is an issue with that there is an issue with DSA tagging
in general and not with individual taggers.

Linus Walleij
