Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C555489884
	for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 19:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785353476; cv=none; b=u1RBhg7i3LWIXs0JDzU1k442bn+YiBtJLR35xeq+IsydTSQfcSam1/dydZVReLfmybuCGpfYlLHhkz5BIPJL3e7dI4EZTZqcNYPcpf6c3PyGg3jWKRPc8VibjuInhuS8knbE/+dIfEYYB87X6v6L2I0F5QHICxUSu+8bSc28mfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785353476; c=relaxed/simple;
	bh=XpnN4YK/CYje0hj7DVcyTxbTRHe+r8A5+caK8rp0maY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=iCKTH5TKW3sxtrf1QN6q7poJActUSFUpIrNMESR6Jb2JlQCqLZp6/ZLd2ZX5SpjndCiDjUecow5yTEF24kBDABu64FoJ1bNhr4kfaxU3YG2esuXynx3kyRxJXGgiUhew43JV6rAyu4KHTO9hQTY+mvXMf9BzNT8aBLJYJdqFlew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=dD168oMk; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OU3HJEgr; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="dD168oMk";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OU3HJEgr"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E4A3714004A7;
	Wed, 29 Jul 2026 15:31:07 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Wed, 29 Jul 2026 15:31:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1785353467;
	 x=1785439867; bh=K4QJaJoJsUeBDeCB9K2zo3liU2XSIec9w6cplOA5ki8=; b=
	dD168oMkodROaBajh4MvTqYT9l+clr57epJ4bfVkwcr2OlHJ5lAXk4Qpg0djIYfa
	0EYyGTdS/ApYPpwogJMGCokUiuTIEUAwwy7EbKbVxwReHrvbWA8w2GUsRmTreN9L
	azKRk0U95gK8+EZvNcgmXVnEx2g5Y7eITPTV+wA4SKKvCnfkA0EDadwFCNjGPnfd
	OyCqYvukBFT8MaOnLDHO2MWMZx9xA3xSEaMAvouwsfpUGfxB3HPDapLAixYJ4lW1
	LeyzBK+g8Li/3eaJcxwM/KU3hNRDk2okndDVuqQAQ6W0FudNFuTjBRqqkOzFjYRE
	Aw/Mr0RCPoOwmaQT2/ACWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1785353467; x=
	1785439867; bh=K4QJaJoJsUeBDeCB9K2zo3liU2XSIec9w6cplOA5ki8=; b=O
	U3HJEgr2B65CEiQYDI5/xmwlmpweXo6qJBNUUb87qeWuVDRMuhPaKd38UfaOKnMe
	1F5sA97kksJVnLv0OfTpxP43qjHzt0UQNOPfvE3Mq2K1ARAsi2K1MGhz8EPqnBch
	9ha8jbtdPoeCXuWfJ5eOvcCACKKkJb2EzNgRvdwfTEHMDTw0solXWIHbqa+w/7A0
	Pr+eZHRNloV67V3v1VQSXbUgyZwAd903FYIpftKOS6/tEbfYTC5J9l2OK9zcq/7T
	8kUDaIJQ1QgE7N/Uo38Xmccm8vpfBKMY3MN9wpzNPrPPU+FfgGA5pBUYFeOoHhwM
	kTIoISTDyup63u9fBSsCQ==
X-ME-Sender: <xms:-1Rqaj81J39XuG0Lnzqk0vGlvQXjL3CzQazDWojzm6MCgaVMRMwyeQ>
    <xme:-1RqaqgZK_FSE4nT75ltTunebzMevBR4h_Q6IlkjnbyBRzw2IbCY3QnbuYY2QqcbN
    D2fUp6xK3u6ekQd8Op7Id8_rHuy-qUKR2cquVffos57mYU_BarKlA_k>
X-ME-Proxy-Cause: dmFkZTFTe6ax3EUo/+XRpXaa7azOuSaB56KRsQgD4/Nv9IMlXDbZ6Kr11v98SD4YUMZj0X
    +qSYdFogL2VXBRhYRu1trbXBKM9ZIedxmvwzrfVc7Fa33f8Sg06WmkIPA4h5v/oBVluvKJ
    TUnhvdthy1gAUmdFS3g6sayGIjSQ9Uz/zd0+WgkX7zdgq5ISsUjk0x4bU5XHlyEWTcJHRQ
    I7cHmKGSsxgawFzqLu1MaETnKmXvOAzHzTpmvQWw1sZCH3eqO2HKKxu5acQohEU9wXBB1D
    OC+RIyrgM+kC2c8I62UCFeQ063vd6rwZDqKcIrF12oL4BPo6Y/XTOOAcf0H3tBl/1Q0ZcN
    Q3dOnGIQZGM7zHMlyELY93gVuKuYE+C0wPhosYrOS1UdGkNlBpwSI0PLvOENdoSc8RBbz/
    6Pajms/4ZxOzNSna91M020YwsjJpOIwgIbtJdRjmXB8gnIpg7NXu/xmLAmY2ELD/CeDgGK
    2T15vHWiJlLF2r8We9f/tUZeotFXsPlUE9Hq245whmJJey4jysM1Uro6J9HltN57syBXKB
    9gJ6ObA+fxJB4xpJ4QtdXxGKU64wxolivkhkZBc6bEP+XvLpyHYCjg1bBpc2C+oNuVxFgE
    Z65yQnJhv0wl8UuRqSWpqWKLliyqpZIx5aN9ioW0SFrsr8Jy0T+4Zd+S/xAg
X-ME-Proxy: <xmx:-1Rqapcnxcl_ni5xHzSeaOOjUqZfMT5tYHFHn0osVATujFkoba2aoA>
    <xmx:-1RqaiKk5wqRwJ-6_WmEb7BpsIp8G4E_5rItraEUIgr9tdqKx8_qpQ>
    <xmx:-1Rqahjld5tuVikSgJ5Pygpm8wGt-Wsurn1H98nzV9SdGZP6sm6faw>
    <xmx:-1RqaoQfzuqrT4Azbd0QeewTvg79QAZnwNDnMdK1mGYwgTrrU1MMlQ>
    <xmx:-1RqahAkyWlt3Mwgag-vTTvW4NyZoNGXOq6_xFUqrkzT4_8l2Y7MPiBE>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 81DE31820082; Wed, 29 Jul 2026 15:31:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AB9oMyFLfqdZ
Date: Wed, 29 Jul 2026 21:30:27 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Rosen Penev" <rosenp@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org,
 "Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Florian Fainelli" <florian.fainelli@broadcom.com>
Message-Id: <d05ffeca-f289-42dd-b454-5a7c7741c6d5@app.fastmail.com>
In-Reply-To: 
 <CAKxU2N9Nt+HF-4TzB3+_5ta=28wb0xCCLuUVO6Bm=LW3ZnNmHw@mail.gmail.com>
References: <20260628231156.1254012-1-rosenp@gmail.com>
 <20260628232714.BD9581F000E9@smtp.kernel.org>
 <CAKxU2N-3zVUM6A-fQnYWud4O7M55Ghc-wnTCG+8DD6_nh2827g@mail.gmail.com>
 <ba56ee70-9702-4b11-ad04-d63322ab60b4@app.fastmail.com>
 <CAKxU2N9Nt+HF-4TzB3+_5ta=28wb0xCCLuUVO6Bm=LW3ZnNmHw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: BCM5301X: drop extra AXI bus ranges that break PCIe
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026, at 20:13, Rosen Penev wrote:
> On Wed, Jul 29, 2026 at 8:40=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> =
wrote:

>>
>> >> commit 4f061464281d4964ce46dab60d36a09328f14862
>> >> Author: Rosen Penev <rosenp@gmail.com>
>> >>
>> >> ARM: dts: BCM5301X: drop extra AXI bus ranges that break PCIe
> This patch can be dropped.
>
> https://lore.kernel.org/all/20260727140939.389-1-strst.gs@gmail.com/
>
> is the proper solution to the problem.

Right, that looks a lot better, at least as a hotfix. Could you
respin that one to print a warning in the loop for every bridge
window that is not bdev->addr_s[0]? That way we can also fix
up the DT to have the correct data, which at the minimum helps
avoid nonsense but may also be needed to avoid future problems.

      Arnd
