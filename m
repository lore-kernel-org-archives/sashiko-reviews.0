Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0745A41A923
	for <sashiko-reviews@lists.linux.dev>; Sun, 27 Sep 2026 17:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790531300; cv=none; b=iDUWiucrfGnL3Jr/FW0oBfq9DQmvV64SSL4cYV5qGG3kpR1128v9guPaDzog27tZJSeOtqw9yDwFs7/uB6PWf3hMnFXtQg3hasx9/gf/1EI1BvrirKb6nQyQoeXqDIJFZiNnnIHYu05QySnYO/a8OBRChhN8DjKxxE9CGfCBlY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790531300; c=relaxed/simple;
	bh=9tCMVdNkP35IT55kMkZYxiVxL1wlT03JU2Np7kTuI3o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MDmH9AN+O3syW/gDgFLdJ6bjTEIR0jYWcaKmff+6QLgMmi/5WVI3mXkWpYuaLDOv8RRV2WgDs/QsiZNPGjFAYE6Zu5ysSmPt/2/LgvjLJR4hglyzvIaXUGc9pfOLLOoasdWhzqCchSTInwJN+F9dAR982mJh6kJ/Wc+8mJDAoCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d2+zprAD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d2+zprAD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9B6B1F00899
	for <sashiko-reviews@lists.linux.dev>; Sun, 27 Sep 2026 17:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790531298;
	bh=9tCMVdNkP35IT55kMkZYxiVxL1wlT03JU2Np7kTuI3o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=d2+zprADYu0HLdWVVfnKPA9zO53sZqJ0FhZpzjEUBL6AepXgLxjY0fR6VSeVSc4Gn
	 1oInQhg6jJOdOYaWYX/5/tcXDKYmoQmYW5DwMKBsHmvwoyVRVYuiTqZwLT9DQYkY1l
	 KmW2o8FLgVNDBxq2Jb0l95NopR6be2D73/8PrymwD/u9TvnA07Wp93Zs1qxDDTcfVe
	 ykDFk0WFujuqTUBC3pNaRjbO62U4uNjRa0hDEUUS4l9rnRJQg2/c2wjqzew+LfQSQP
	 W1bOnOiSGvze7UlvfXsZWQDvdO+RTrdyoX/IHCExzMuN4sq5Gkfvh2+kO/tCy8bhLr
	 6rMOkHiasdMDQ==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b8f27a48cfso669791e87.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 27 Sep 2026 10:48:18 -0700 (PDT)
X-Gm-Message-State: AFq9FYJtpxnUxBzKitaJFsWNSlHgZoWDE5/7mMnc8MO9+B8/Xvd/yqw2
	PXa8aug1akqHiGolFvbKmlOBRAx5J6fvsWKiOdxOSl0jY2qHqL8pdIREbl8WPx7H0jr7dLF980y
	RewN2CBQqsg5ZRnAY3z2DAtism7bxy0U=
X-Received: by 2002:a05:6512:2396:b0:5b8:f2ca:40e6 with SMTP id
 2adb3069b0e04-5b8f2ca4232mr1294357e87.8.1790531297453; Sun, 27 Sep 2026
 10:48:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260927-dma40-fixes-v7-0-89f595e8851d@kernel.org>
 <20260927-dma40-fixes-v7-6-89f595e8851d@kernel.org> <20260927092431.DE0921F000FF@smtp.kernel.org>
In-Reply-To: <20260927092431.DE0921F000FF@smtp.kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 27 Sep 2026 19:48:05 +0200
X-Gmail-Original-Message-ID: <CAD++jLmFQiqiuJpF=Mo9bkF2n6_Q9nKjKR0x3Lmgw4107bUGFA@mail.gmail.com>
X-Gm-Features: AclHuK9ty_hlcVfOqVsIEWWAP2Dv2LmHPHtWsLwQyvXHBviYrFQVUhYWR49-6aA
Message-ID: <CAD++jLmFQiqiuJpF=Mo9bkF2n6_Q9nKjKR0x3Lmgw4107bUGFA@mail.gmail.com>
Subject: Re: [PATCH v7 06/24] dmaengine: ste_dma40: Check runtime PM in IRQ
To: sashiko-reviews@lists.linux.dev
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 27, 2026 at 11:24=E2=80=AFAM <sashiko-bot@kernel.org> wrote:

> Will this cause the kernel to eventually disable the interrupt line
> ("nobody cared") and permanently break the DMA controller?

Yes that is the idea.

That is what spurious interrupt handling does.

Yours,
Linus Walleij
