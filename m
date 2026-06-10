Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322E2318EF4;
	Wed, 10 Jun 2026 07:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781077416; cv=none; b=kSBITxDImdaLQmKkBjdUGVgXysHcDgOp6ygV846hG7poW/vLeVSlDIoJ2oM4PDJsxRct+FpLohPwTokTz0ZAV/2KsyTdyLrzwF/KBIEyIXu3WZxdHbCCTdyrnhL3ykErccfIQInIzNx6IvbpGS+idzxmblmByvAz5oI7LTfmPXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781077416; c=relaxed/simple;
	bh=URQJCTbAJIoCNSIMY8IOF/aYzgKA33LcT/MKWu2oEfE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ebiY+1pbFtC+oR+sj1jbSr4s/TzwKz7V/DFS9oU/Ex9ur4EQKYBCHPjUuCRIbORlqyUfPK30ahLlQJTQszvsF7XUGsGo+XtQajVjnS9yqIVmn/rGt22dWp88HgChnwqXdBIjGBo3liwzMMYn1FTblZ0TbK/bJmq98bFDWpvSHeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=QAJx81ER; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=HqWux+Vj; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="QAJx81ER";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="HqWux+Vj"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 4C2261D000A9;
	Wed, 10 Jun 2026 03:43:34 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Wed, 10 Jun 2026 03:43:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781077414;
	 x=1781163814; bh=Bdspv/mWgnec4IJT6Knjkn3iUexEa46V5UFr5fP0nw4=; b=
	QAJx81ERBEu/VvCfwMYUPfKqkCjRZqAjfnRIYQBn9gLAikBrpvNbUnpFeYz52suf
	mDQhfsO4msLMs7fZmqWzxMn7150kSu2yqHECVtTuBmS2D3Lhp4v0fbS175kmtBPx
	o2nU04zklH9Obvv7h8zKyu+xhKxjM/xwogZ8lbpq8+STmq474CBPcXbsBr9kBKts
	yT7D6zzR2cOhGqGi/geWOC8BsV3Bg9NvyiqMr8okPsJX4BH8elw6Yj1ZBvjFlGUC
	fyxu9WprD4Lcj+Hs5xn4dkKHNd44VmZqGThJ8SaP7cTqf7/Jv7aDLDFqKXVY4UwP
	uXl8KXzcbjkPHtcdLXaMdQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781077414; x=
	1781163814; bh=Bdspv/mWgnec4IJT6Knjkn3iUexEa46V5UFr5fP0nw4=; b=H
	qWux+VjW2aMM8s9XAUjdJ9AobrpVwjpEevmTBeAvJHsS9vrfEuPnW4lSEet8PCjy
	if+1rBg5Tp8lqzoS/VzPg+JbT5YOPKZOBqNvWKBSC1tvD8UhidTVNTwxr/mMNF6S
	udmNjHjXbeZrTryc2w3tLKSE7K08P5Ha6yMS/uqUuU3+7BP38y+aW2BfuDCn49+a
	zUwaE6IbOZePEtlYE4Ao7TpkFhDhJoBvlB/5X4mT8Y2pOd04s5P5ePQ3JvarvEIW
	3V8fM2WzxU5NwS2RyHMAG31qnucQCfGEf04i5d7N/ksIGAOtLzRDZcAwIrajRuEH
	VypOAQifEDE++v1LDwoMg==
X-ME-Sender: <xms:pRUpamki4cP4W8Mo9wQTtvR1f0mMNHhKaysWivrPr4YLHMxwQU7D5g>
    <xme:pRUpaorQIE4WsIu3QQq-FLHEdp3zfD2pklNjGwymQlVih6mlSit-YRM9Pa1ePvyJ1
    hwLDy66qtDrRwVyJwpAvchiUAbmZjXthb2nHMMsgWcpGS2PugUAc3k>
X-ME-Proxy-Cause: dmFkZTEbSF9yCd3WJfzOG54G2rTUXrqdwsJ0Ppx5q3iCXeGOyJQmUssYWR1FWpFCTWNFX7
    6CPxLBSxVhu4KIJl5Is1ZoRSxQBxktbZPieOHRcUSKt+ejPzGIdP5vQd7Vx+NGuLRWLAuN
    ujthz3X+tkgi/Qqq7jiCIRqZ+Cammqb4oASt3li4MYVi6yDCoNPr1iMksy2VwyP08H4Siq
    j21kffMuz5vubv75vkPLXnmg2Q0J6Ij4EXYfYpEh5MS2oCgxY6c7dYpbbK21IIUXgAq8v3
    HZsFbPa9KOu7+HwqP4M2ePvRsE/He1a18o1oFPEuuFgSuxwrinysMRDZpNvkBL37CLOjLA
    UUMXs7AufTgu1PmlZNZwSAO9Zda3G4bfDqZDLvV6mA5xktgqRcANTgNrNUJMi7obj/63uD
    jwgr/aB1sP//I3GOp0Jqjy36z2eyZiA2o96n3PSqrBs6Txao55f5wcnK43007PHVlXZ/ZQ
    8wzMJEabdS9eXzuZBkZLFldwISwUnyHkrGDtTwamWSQko8Kz4BBxJ3yMq22PvSHQrKcqHz
    6Uy7B85NYacqEKi70aNzG/EDBpXd0/VtPYtEqT+sm6rVmc11mLvJ3cXTkwHmgr0/iJ3hGx
    VxBsvbcYg6Llo5Lx9Kv4g02Gr6Ytvlax9kAqzapmz58qWTjZoaQoaf/T9iHw
X-ME-Proxy: <xmx:pRUpavAW3P8J60cIOWImZFiuzBNrPYCOBcZhG-aWr3Cu0Soj5Fd2xA>
    <xmx:pRUpaqcZHgDBifQ4UleK_8w9_D7F7URJympnZdHAOZ_Jq_38fHUo8A>
    <xmx:pRUpau0lURFWHuaGItLban6Xy3u9AmP0ij6Vg9uFfEIEJ9Y3PM4cLA>
    <xmx:pRUpahjKvdUZl0vh8-jPlDpLR2iVddxAjDG-1Ien3QI43nTzg21mqw>
    <xmx:phUpatzMQNIvJMwnOFu1LSJBUDvvVRF9L3xYWYCJFnSR-u-HovqBRdx9>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C4E40182008A; Wed, 10 Jun 2026 03:43:33 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AdNNzaliM6k3
Date: Wed, 10 Jun 2026 09:43:12 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Frank Li" <frank.li@oss.nxp.com>, "Josua Mayer" <josua@solid-run.com>,
 "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
Cc: "Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Frank Li" <Frank.Li@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>
Message-Id: <4f7cc399-785f-4967-adec-714ccc69ada8@app.fastmail.com>
In-Reply-To: <177431ea-c4ba-4424-b17e-9d2e2884d466@oss.nxp.com>
References: <20260524-lx2160-pci-v7-1-09370c23b952@solid-run.com>
 <20260524151347.BD92A1F000E9@smtp.kernel.org>
 <3528dc91-1ffc-42f9-94ea-a27c6c1d6a50@solid-run.com>
 <9e6326f6-dad1-4169-a63c-e62ee5b341f2@app.fastmail.com>
 <023aa47c-6fbc-486f-b5c7-5145ddf8e8fe@oss.nxp.com>
 <72087d5c-c6f9-4452-b4bd-a9f086700e62@app.fastmail.com>
 <48248207-7b4f-43c9-85e9-64e8440fab10@oss.nxp.com>
 <753fca23-c3eb-45e3-aeac-b7b248fa723a@app.fastmail.com>
 <177431ea-c4ba-4424-b17e-9d2e2884d466@oss.nxp.com>
Subject: Re: [PATCH v7 1/9] arm64: dts: lx2160a-rev2: extend 32-bit, and add 64-bit pci
 regions
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Jun 10, 2026, at 00:13, Frank Li wrote:
> On 6/9/2026 4:31 PM, Arnd Bergmann wrote:
>
> If EP itself is PCIe bridge, it may be problem. It'd better to
> keep 32bit range unchange.

Ok. It is not uncommon to have PCIe bridges either in physical
form, or inside of devices that have multiple PCIe functions,
so this does seem like a real problem to me even when more commonly
you'd only have a single PCIe function with a single memory BAR
on each host bridge.

> Do you need rework pull request?  Or you can drop this patch.

I can't easily drop the commit without losing your signed tag
on the pull request. Please update the pull request to either
drop this on your end or add a fixup patch on top that reverts
to a 1GB non-prefetchable window for each of the controllers.

On a related note, please make sure that you don't send
a large series like this late in the development cycle
so we have enough time to resolve any issues that may come
up. You can also send a follow-up pull request with last
minute fixups and changes that were still waiting for
review. The bulk of the branch contents look like they 
have been stable for a while, so the best thing would have
been to send those in a first PR.

If everything goes well otherwise, this PR should still make
it in time, but it would be nice to avoid such minute
excitement in the future.

       Arnd
