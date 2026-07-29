Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864483F23CC
	for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 20:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785357829; cv=none; b=NCMK3WIRz7dSlGZcwPXa5qWUsk8ash4TO4EFZJ9tGICUqOaA2L21U4nfxaWfzKH35En4nWrrCtKtppEzCRKqpYvOcxA5C3HTMm/aFlj7bmwTSP5LGVgXMzo24Jq787AGtxjLLkknJFGYmOzJ/YoXn7R1hrG2nodhCxxM1om2D28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785357829; c=relaxed/simple;
	bh=XIfM3ZB33j/guyOrgPWUHK3Q2Inf2QhP20MVrTf3xcg=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=X0uiqDQrjWQqZ6px5sHshexWj4njDf1r6oZv//crFS3rgR25n9dAoxRDSjQHmb9m25Sf4vrSeC7V1POY6X3esTLPoTPk+i54sQ8WDyWMXNLwEA1LCVM0X5Z5vHl8Rva5L5He4VSsT7woUzQlRNDZQd0GQJqoWfYSl9aIq3o1k4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=k4Up/trd; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=f7prrGWL; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="k4Up/trd";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="f7prrGWL"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id AF69E14004C6;
	Wed, 29 Jul 2026 16:43:46 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Wed, 29 Jul 2026 16:43:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1785357826;
	 x=1785444226; bh=qB8QYU+jeQj5jcFyk4T2+kBjDPZKKZxwXzTTUTd6Zyk=; b=
	k4Up/trdYCWI3ZscsC0G8WOOIwxsEph9mc1gBTpGGjtQPTOIcpHXoqRdmOAlmY74
	dRhHWg6Imfojk7tJcNAud8UT5ybGZFkQuRo2JO8AjkC6zxSx0p2f930K7jTOMcJe
	bfcnu7Q6k3XIbamKQA8kgoxPY2E8c0J4HCTo1WSeVhKhTS3n9kJVZ4CCLjkWh/WQ
	q02E4Shp69+P06OkV+6GBFn5Hf8TlSXofzZt3yZWcT+TkCDONDDFCi7m1Hviswm/
	FDBUa8/DFC7dKyCyjhkpu/URhAIUvUgZDF9jHzQnL2JcH09y2X++st88RWLrwsz4
	hUJHBEMsBaMO2kaedAscjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1785357826; x=
	1785444226; bh=qB8QYU+jeQj5jcFyk4T2+kBjDPZKKZxwXzTTUTd6Zyk=; b=f
	7prrGWLgfd3aPKOdNIj1JAybDPHWps7ZonBYk8z5dhIiF5OmDVtxX0VFGz7D7uhI
	XZBVcjUL8P5WDVAIoC1Kk3h3HpGWLk55Jzb793u5/VgOZATJT/2cwLwwHx8fOhtZ
	gYI0mFbGp/jNT9K43OgJ0DxC2jTRrf4TSAxlUZxFxpbiRkUMGqCQ5bxdk52/1Hxx
	ao3Ezafe9x5PcQYga/KnpcIvEIYh9T/s84FM3mSnFAOKaACK9LO0Eb95GqNXLWk8
	NDhdAEYRuEMxd/xnzy96BBNiNupKEywx/MfVS4aZSSXbqxvdqGTtKXNl1zHTaCyz
	Z7s4xNJwdUTh1e+2unp5A==
X-ME-Sender: <xms:AmZqamPv-f2qxm_GZYFnmrFIiw7_3fTLIgYETtu0Tf7sIQBmRvVY5g>
    <xme:AmZqavyyUBUdOLQFK0cW_PFdq3XpiDqGH7l_ZopoEMIx3szVdiCA-Fl4m4xDj4OUi
    wXzUn3I9bLs7N-jhVepJczrwMQKhSvWFuyYm5Or_2GHRdT0xJ41WP0k>
X-ME-Proxy-Cause: dmFkZTEUoJ1/cO3k4RXkqGg3MtALaMbfiaRv3dEi9FZuqXJ79AskfJXMTIOErcvYvXtuHR
    x1RAxYsz4btgvZ19H6ev8lLAZ+jJCfQ/WJPmO7BoUe15fPEsnG7yOgduOU78rz/vQYteVt
    ZgXE/GlsEoQk+kqh9rqtjs/QUZsMcviabU5zOXpTmPK7d5wXhMLyBBUpmoiyj7U8L4SCWE
    kZs82wWXKFamsu62QTAzQA8iYUT+3J+9ShTSOfl5KfWbRQ5bFQ45V5a7/pOYBI/nbE11jG
    dQ4L9ifKxaqUVHJ+n4W9QQFl2dSrMwxOE0q9weiIkOW4Tb9kX+av6TRzxix4mo8Cwth9cQ
    uTQD50qcpTH8FA2fsu2iKdT64PUgnC9w9zCYZDhjf/bEvJorn8RPfBtmw+gWbZvYVlYKUN
    ACUgMr3X0sjtEG1DAJkmgEQPTo3XwJ2AS2JWeg5hcHzwz9A9Xsz9hEGJ1EbUEMCBlY0jA1
    96JebM3D4H389A/6yasRU31lBOqIMdID1sdK2dPZgOuiQ2Hrj6CMHxOIsqS503OtiPgUHI
    cFjv6CuFgfk1JM0xeRaR8Jr2SGyDgdDPef6Pc69qIBYQ/ZZNoFcan18WcsTxkh6poER8Ix
    K0WCQjjZsHfySQpmNrT5rbTuxUXU/EMtrqPDgK6+R7TKOzxeDVJE627BBsGg
X-ME-Proxy: <xmx:AmZqatuu5j5QzqtWHfsOlW5xr0fqG5zCcGLzYts6D9HHUj4q3fy1sQ>
    <xmx:AmZqahZUZbS6vEmU9EZAT3kT4hRPqOAdsnDXgLSP8fwKzSm3slbr0g>
    <xmx:AmZqavwHAX_kTzJu8ui3So8vyPDXqs4z05B-gIbHiJObBleZuR9KcA>
    <xmx:AmZqapjSuuOoDhNSCparlPrERV1gAoUpNgpPcU0jyed9zaxNP6w09Q>
    <xmx:AmZqaqQNOZCCoQ9F2kZxauKfHc-pDKgQ7Da7D9zLw5lWumtyMEvPyDJ->
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6BC2F182007E; Wed, 29 Jul 2026 16:43:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AB9oMyFLfqdZ
Date: Wed, 29 Jul 2026 22:43:26 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Rosen Penev" <rosenp@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org,
 "Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Florian Fainelli" <florian.fainelli@broadcom.com>
Message-Id: <3e4eb418-d574-4516-8c5a-1488c87baf91@app.fastmail.com>
In-Reply-To: 
 <CAKxU2N8Akw0+dc=wHUmLrqJe6d6rrk2O-BqeRB7D55iU-S_uLA@mail.gmail.com>
References: <20260628231156.1254012-1-rosenp@gmail.com>
 <20260628232714.BD9581F000E9@smtp.kernel.org>
 <CAKxU2N-3zVUM6A-fQnYWud4O7M55Ghc-wnTCG+8DD6_nh2827g@mail.gmail.com>
 <ba56ee70-9702-4b11-ad04-d63322ab60b4@app.fastmail.com>
 <CAKxU2N9Nt+HF-4TzB3+_5ta=28wb0xCCLuUVO6Bm=LW3ZnNmHw@mail.gmail.com>
 <d05ffeca-f289-42dd-b454-5a7c7741c6d5@app.fastmail.com>
 <CAKxU2N8Akw0+dc=wHUmLrqJe6d6rrk2O-BqeRB7D55iU-S_uLA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: BCM5301X: drop extra AXI bus ranges that break PCIe
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026, at 22:26, Rosen Penev wrote:
> On Wed, Jul 29, 2026 at 12:31=E2=80=AFPM Arnd Bergmann <arnd@arndb.de>=
 wrote:
>> On Wed, Jul 29, 2026, at 20:13, Rosen Penev wrote:
>> > On Wed, Jul 29, 2026 at 8:40=E2=80=AFAM Arnd Bergmann <arnd@arndb.d=
e> wrote:
>> >> >> commit 4f061464281d4964ce46dab60d36a09328f14862
>> >> >> Author: Rosen Penev <rosenp@gmail.com>
>> >> >>
>> >> >> ARM: dts: BCM5301X: drop extra AXI bus ranges that break PCIe
>> > This patch can be dropped.
>> >
>> > https://lore.kernel.org/all/20260727140939.389-1-strst.gs@gmail.com/
>> >
>> > is the proper solution to the problem.
>>
>> Right, that looks a lot better, at least as a hotfix. Could you
>> respin that one to print a warning in the loop for every bridge
>> window that is not bdev->addr_s[0]? That way we can also fix
>> up the DT to have the correct data, which at the minimum helps
>> avoid nonsense but may also be needed to avoid future problems.
> Not my patch.

Ah, my mistake

> That patch effectively ignores values in dts. Needed because of bcm dr=
ivers.

Sure, but my point is that it fixes a regression introduced by
767012397976 ("ARM: dts: BCM5301X: Describe PCIe controllers fully"),
which tried to address a warning about missing ranges in dts.

As far as I can tell, the patch worked correctly on the
platforms that had the right windows set (presumably bcm47094/ac56u)
but failed when the information was wrong.

Having addressed the build time warning of course is an improvement,
but I would argue that actually having incorrect information is
worse here, even if the information is ignored in the end.

       Arnd
