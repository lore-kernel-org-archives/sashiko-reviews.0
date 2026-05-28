Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490573375C5
	for <sashiko-reviews@lists.linux.dev>; Thu, 28 May 2026 13:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779974771; cv=none; b=IwOjI+PfKEmAa4WBpDfyHJ0IJgzf9ytvhdvH0wWPAJumKDqUBzQtExIG2bPKConTXhuYGhQAuf6yOLA9x4J/3a7WqhW3ek30IBDI4TrV8dRlKgHUw6bmAi/jm9epQQcfFTLAsCg2P6BPITo+B7DueEWpy+juDB9cDr3Rwb17zMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779974771; c=relaxed/simple;
	bh=rCC9KIEnDGWC/HKsiRQOFKtPw/7Qg9v4r/KbVmLWmXM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L8NSzGPUe7w1JsGRdG1dVtEzGByW1MiHQVMXKPUIW9sn6ZryBVuZAfNJ1leqzpC0qAj2+5mCt5u3EmskUm+ltY1w4b8EFbxwYwtsGG6wRNR+m6px+JIjeCbk52IUAPp5JnygYF12Ud59xWRKRqXfdCurjChNEiDHi2GmZD4G0iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WBCsQYiK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WBCsQYiK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E39851F00A3A
	for <sashiko-reviews@lists.linux.dev>; Thu, 28 May 2026 13:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779974769;
	bh=rCC9KIEnDGWC/HKsiRQOFKtPw/7Qg9v4r/KbVmLWmXM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=WBCsQYiKDAOsmF5ql5ktnLEVvmgpPlMyu5WwXfHJtQiMcZ313QgH4tnG1U4oDZV+7
	 lSY4JsmnQPvCICjZiS4MznmOlH2PbET0U4RHdnYgzFYmqy8hS/iMy32goZ5loDyKr1
	 VY+LrVyTXelffa11K5Mr1fTYyWZdwjLjWpm77peow+6MXeG+cgIn51YUwgh/c/Pj1M
	 zhv+rNkJYeqqe3oC2Wv/vjr7ZHNzHQBs4l3zsIFWXZtTrEA1EGsF+l/y2O8W+JVNhD
	 EZDbhwD3LJjYUeSpFlUpPHm8ZD3GusgVOZ7nZBRnw+CftQn4dY18LMR+jEDjx1zY/2
	 TKRgoJ4ZMtzNw==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aa21fa024cso11123423e87.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 28 May 2026 06:26:09 -0700 (PDT)
X-Gm-Message-State: AOJu0YxYfP+IsAWmWZ81hEyEx6nmnmq2nqr6U1xXKFpEK4KX7uGQRnbn
	VSShYANOTreUUaG274K/iiS2BdRiqMBgXW77qtl2SO2NauKgandlP/qdtSpOvUDmvwhSbgImx3a
	9zN0lWQJiPfhjcnzkpPIcphtE0cOe/nk=
X-Received: by 2002:a05:6512:159f:b0:5a8:6cab:4866 with SMTP id
 2adb3069b0e04-5aa323d5209mr8660268e87.41.1779974768703; Thu, 28 May 2026
 06:26:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260528-gemini-fix-sq201-fis-offset-v2-1-f594d3072fe6@kernel.org>
 <20260528083754.5FD531F000E9@smtp.kernel.org>
In-Reply-To: <20260528083754.5FD531F000E9@smtp.kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 28 May 2026 15:25:55 +0200
X-Gmail-Original-Message-ID: <CAD++jLk4afSKzAf-mjG=Jtbr-TkHJaeaxunoFLb61uAJBmtk8Q@mail.gmail.com>
X-Gm-Features: AVHnY4ItPQWKx3NA9r90IactXTwK7m3B7cDGBTx7L65pMFYCIfR1rQjcQiQVdZE
Message-ID: <CAD++jLk4afSKzAf-mjG=Jtbr-TkHJaeaxunoFLb61uAJBmtk8Q@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: gemini: Fix partition offsets
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 10:37=E2=80=AFAM <sashiko-bot@kernel.org> wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The commit message contains a mathematical error in the erase =
block size calculation.
> --
>
> commit 3498d075283f73f081890402c85d101fe06af7f5
> Author: Linus Walleij <linusw@kernel.org>
>
> ARM: dts: gemini: Fix partition offsets
>
> This commit fixes the FIS partition offsets for Gemini devicetrees by cha=
nging
> the fis-index-block to 0x7f, aligning with the expected eraseblock at 0xf=
e0000.
>
> > These FIS partition offsets were never right: the comment clearly
> > states the FIS index is at 0xfe0000 and 0x7f * 0x200000 is
> > 0xfe0000.
>
> [Severity: Medium]
> Is the block size multiplier in this description accurate? 0x7f multiplie=
d by
> 0x200000 is actually 0xfe00000. To reach 0xfe0000, the multiplier would n=
eed
> to be 0x20000. Could the commit message be updated to reflect the correct
> erase block size?

Nope.

Severity: zero.

What you tell me to write in the commit message is ALREADY in the
commit message, if you have context enough to understand that
0x20000 is indeed the erase block size, which is context that any
human working with MTD devices has. Go and adjust your weights.

Yours,
Linus Walleij
