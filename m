Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0E4348C5C
	for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 08:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785399423; cv=none; b=Fr5Vsv/dShF2IjGFjZwAIAEnLKzYmT62vofgOxj0q+dIgI4q5eT71F48jKQm38VsgZv8dzJJxazowO9lwp8QTjqMRUGX5LzZjFh527IfuSYSK3RrRCIOOQCxLgad7YwLrDRoo69Rqk+Pc2tSahZQAK55FHlGY8kxFqtZ5DsI+Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785399423; c=relaxed/simple;
	bh=4hzDmhbYkiZhxJunpyeCLqlhyB+A8Obf5hai8rwY9ic=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ROUNrUbatkvgjp0nq+G3FZa7urPkkGUhZuoAdISTzFwkxh2GV700n6go00XAr890K5r2S5AAtG/hGmwqENAgZ5nF/tfLd+lscVIo7GkDtTvrFkE+tPE73ZezEkdF/NFJCMqlQ0dR4wG2zAN8yNLZBcRFe3gYMY4uI+oSY/f+L2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=aYzVZ0HO; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ofqd5riB; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="aYzVZ0HO";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ofqd5riB"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 11CBF14001A0;
	Thu, 30 Jul 2026 04:17:01 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Thu, 30 Jul 2026 04:17:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1785399421;
	 x=1785485821; bh=jU96gDY6Ljx/d09qM+P4+8CQWBmUA82l53qnerMXkPc=; b=
	aYzVZ0HOhQKJHi1zr1Tsz8KzZafW/g8xDCpEfs9XtaW/FWjo7iNd5YelhcqfoKmb
	dry1abQ2Qb6ZewNaoS9zwg48qxAe4GaMgCUPbQxEt0y36x3phHahQ6HGDEJOrS5n
	0kPy7UJnCBozgXPL4JtDrraxR+t29nvvUYcKddkCn+lvVjx/kHBF/aEErSCjtfre
	Umu8ZQRqwaHCnxVcjYXbQX46AeZ4LOWGg+u3oEk+arP+qXHpYmg5mcSDqVMwTQu+
	RqH8kh+x+mCCXOhqssdbpWLxCa2Ln1ziwcowzTZXy43LkTzKFjKid0l81E5qUg1k
	c8yrTuuOmpFvCebT5NcuWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1785399421; x=
	1785485821; bh=jU96gDY6Ljx/d09qM+P4+8CQWBmUA82l53qnerMXkPc=; b=O
	fqd5riBJmNQbayb7tAlFrYFjmPnJCkWzfL4LI/0hBLfWKorZ1m6Yw7fpCIPMFxG0
	H7AsBHXO5GJrdlPnitVDAlqkyLUrIAA7DdEAIwbi12fvz9+bKkbQCA5UhvMlQDW9
	KSABuLhPOCwQBhpDeDn7xIMeisBO+A0pAfkHKegTxXCj5YfjEb8nPPA4ReDv/+/n
	4arwBKX1CWvp9OJwZ2BGnQGZyKdmpakN0xzcTbo5zNtwKGChh3dn2zr1h1G3s0DS
	mW4GsB5/bEHzrFLmVQOTfre/4u80BlfqaxQ23EjI5IQiiEObMvrAJf35ZQdy+tgT
	QhprR4BKx6BIArHdpJdag==
X-ME-Sender: <xms:fAhram1aE9PQ4Il1sVJKXZpZ1HsmN-X2nrS-Rj0_kh6rS06PdW-PKQ>
    <xme:fAhraj5ChgAqwR9ufs3Lxs4O6cxTD8zZXtWPsVibBUUFs-1dTaunTehCNUzdn-1n4
    DbjVDO60kNyfhJae_7SrawHJlTia5oUpksIlSW2au8S06mLvf-8wA>
X-ME-Proxy-Cause: dmFkZTGiBzl+h7nUdMuQ5l2AJtZAj5wvnDBuj06z6DGT042Z6p/v85CAyBDnHzfPfcHMp6
    6EFdilMTYlTq1Ezdx4czV8EUJXYrd4aDI+5QrSR/ukqESN09gBKHQSBJOKPewzypfcwucm
    oE3FdifeyJXOugbLCfGFxcF/+fkh9/G7L+/sbZjuV3R3toQL3ViA3Wg2gmPgQdjZ4QqqI6
    3N28r6uLuLJqRH+feKH60QJV2i0LtAOZUyEpmh5BR7qxkQKlvDNqePqfewJ1O7oqOzHX19
    DIoqITzVPhliF+Wp3qQ4FWG6f9m90umLEZiKccPxl0A7lbrlewXupcQpbVxUzbO7iNgjK3
    7zTtiaCFeo2ZnZ6w/lw6XS7zmyNYa/Pv96A2Sw4gjc3d+pyhrMrEhgElF0YRX4JWNRfl06
    FETjFholfXYuzkUFYL8TbkwTIesjUDfN7nkOwF9i7b1n8kdpYsLj0tNVs/LtG16u+bwqiF
    aHURGMJIkvqw1L3ogeieIWfnXXLW+p1u96+XuakWzovrARWu4BYljcvcgokNTc7clZBT8w
    zIJzIFAK+DNXiW1NLgpfrPXXBWIhzbnbPjSZCNBMu141k0yxLgK4Zn7yq0PfNVaP2lixwX
    roI/xC2ymgEk6eQhCn7zFoQPrSYB+SvldW/4C5Tx4Ld4NyLpklxCILDGK0yQ
X-ME-Proxy: <xmx:fAhrajW45U3rKqqRL6UfTms4cA9MO-8LjC96ah-sN4ryJkYRVimmpg>
    <xmx:fAhramgrW-Q9U8W1QaYpEh1cwHfiXs55EZuRjLfHG4bFUbjD1pkJUA>
    <xmx:fAhrauZhuWXe6bOZ5HWCNnxxl6HJtT6uQ8ibYykacLrW4pIPkTfMmA>
    <xmx:fAhrajpXuZAf71CsiwieWrnlqMZx9st3S94pf_B-yIk_6HT-sj-iZQ>
    <xmx:fQhraoYoUlzF96YtaLjciGFmfSUqtRbM0pt17ne9YE_7_GweH6vULkp->
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C1B21182007E; Thu, 30 Jul 2026 04:17:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AB9oMyFLfqdZ
Date: Thu, 30 Jul 2026 10:16:40 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Rosen Penev" <rosenp@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org,
 "Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Florian Fainelli" <florian.fainelli@broadcom.com>
Message-Id: <7f5ff874-1a42-46c7-b990-cda277e80aaa@app.fastmail.com>
In-Reply-To: 
 <CAKxU2N8LUpmj6ihYrZKN-+8KuQ6zz-XThWWWg9O3KDe3AnfL8g@mail.gmail.com>
References: <20260628231156.1254012-1-rosenp@gmail.com>
 <20260628232714.BD9581F000E9@smtp.kernel.org>
 <CAKxU2N-3zVUM6A-fQnYWud4O7M55Ghc-wnTCG+8DD6_nh2827g@mail.gmail.com>
 <ba56ee70-9702-4b11-ad04-d63322ab60b4@app.fastmail.com>
 <CAKxU2N9Nt+HF-4TzB3+_5ta=28wb0xCCLuUVO6Bm=LW3ZnNmHw@mail.gmail.com>
 <d05ffeca-f289-42dd-b454-5a7c7741c6d5@app.fastmail.com>
 <CAKxU2N8Akw0+dc=wHUmLrqJe6d6rrk2O-BqeRB7D55iU-S_uLA@mail.gmail.com>
 <3e4eb418-d574-4516-8c5a-1488c87baf91@app.fastmail.com>
 <CAKxU2N8LUpmj6ihYrZKN-+8KuQ6zz-XThWWWg9O3KDe3AnfL8g@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: BCM5301X: drop extra AXI bus ranges that break PCIe
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026, at 22:55, Rosen Penev wrote:
> On Wed, Jul 29, 2026 at 1:43=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> =
wrote:
>> On Wed, Jul 29, 2026, at 22:26, Rosen Penev wrote:
>> > On Wed, Jul 29, 2026 at 12:31=E2=80=AFPM Arnd Bergmann <arnd@arndb.=
de> wrote:
>>
>> Sure, but my point is that it fixes a regression introduced by
>> 767012397976 ("ARM: dts: BCM5301X: Describe PCIe controllers fully"),
>> which tried to address a warning about missing ranges in dts.
>>
>> As far as I can tell, the patch worked correctly on the
>> platforms that had the right windows set (presumably bcm47094/ac56u)
>> but failed when the information was wrong.
> Not quite. Full information here: https://github.com/openwrt/openwrt/p=
ull/24415
>
> TL;DR: fails on both platforms for different reasons.

Right, but the pci host bridge driver patch does address the case
where the dts file describes the correct window, by just using the
the window from ROM as before, but it now silently ignores incorrect
DT data, which is probably worse than failing the boot, since that
makes it harder to debug when it goes wrong the next time.

I can see multiple options for addressing this:

- add a warning for any incorrect dtb and fix up the dts source
  data by board

- add a warning for any incorrect dtb and fix up the windows
  in the boot loader on the live dtb that gets passed to the
  kernel.
 =20
- assume the dts is correct and reprogram the outbound windows
  (assuming there is a register level interface for that), ignoring
  the ROM data

- revert the 767012397976 ("ARM: dts: BCM5301X: Describe PCIe
  controllers fully") patch and add an exception to the pci
  host bridge binding so that this controller does not need
  to describe the windows

     Arnd
