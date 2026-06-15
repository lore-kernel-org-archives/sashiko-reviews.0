Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3905A382379
	for <sashiko-reviews@lists.linux.dev>; Mon, 15 Jun 2026 05:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781501804; cv=none; b=IRABMx6qCLWCKibW6cyePumLWXa0YExenXyBqE34UUQlCgHqd1pYYxd0laCuUruU7u/73zBU2QwstZNHGjvcE+5RlwEqopCFZ1aDVuNljsBQB6HDeIo1ELZDrWMUujB57bxVIy1KwkbldbuOlnTfGr7Lwt4so1qnwjbsPpztwY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781501804; c=relaxed/simple;
	bh=VZgiyT95X0e5PDv3s9L6rOwD+r+gbXddQ89RG2HR2b8=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=Qp5/omcl5cVHFAulqGuIZ33PPQQj7GhgUfvX/A9LmX5d4HtGbcFMOZ7IpIEc4b5s3g3rrr8j1B1anEmK/KfdWO4BDIuhCS8dhSd3dEYCGqjf7NqQP0TtNOXqDheJjY6UhYiukxDjGHYU0fONeopJGPU4SXm13yKeWRGfGhI5oDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=BxxYHtwc; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="BxxYHtwc"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20260615053631epoutp014a18caa2662ab4522cd1cd4aaa33bde6~5KnDjJ4eO3274232742epoutp01G
	for <sashiko-reviews@lists.linux.dev>; Mon, 15 Jun 2026 05:36:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20260615053631epoutp014a18caa2662ab4522cd1cd4aaa33bde6~5KnDjJ4eO3274232742epoutp01G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1781501791;
	bh=VZgiyT95X0e5PDv3s9L6rOwD+r+gbXddQ89RG2HR2b8=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=BxxYHtwc+QqQP+0jil49rhjXqmM4EKL0v7zlCYBd+mWYyHppaIomYtw3qu0rWIxSb
	 PlHAIaLHK4JofhLs1HYWF0tWq93BCHRK2REhXSI//ZDR8rlISlr7j05JsLrFWLoPJ5
	 uPeoMlrI6mJjrPsAt1Og+QbF0JljJuTXyblZQMCg=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20260615053631epcas5p4bab19141873367d2c1512c58ed8d2dc1~5KnDQwof_0683606836epcas5p4j;
	Mon, 15 Jun 2026 05:36:31 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.92]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4gdzPp57D8z6B9mJ; Mon, 15 Jun
	2026 05:36:30 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20260615053630epcas5p2f7154ee25cdcefc604eda766013f90ed~5KnB-II5X2123821238epcas5p2M;
	Mon, 15 Jun 2026 05:36:30 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260615053629epsmtip196c4d6881af617715f6396df4b67bdc7~5KnBNz64f2068920689epsmtip1T;
	Mon, 15 Jun 2026 05:36:29 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: <sashiko-reviews@lists.linux.dev>
Cc: <robh@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>
In-Reply-To: <20260612162335.1F9361F000E9@smtp.kernel.org>
Subject: RE: [PATCH 4/5] arm64: dts: exynos: add initial support for Samsung
 Exynos8855 smdk
Date: Mon, 15 Jun 2026 11:06:18 +0530
Message-ID: <000001dcfc88$eac875f0$c05961d0$@samsung.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIJF/JBY04orJGzCW+OH3XyVBjlqQMtuzB6AcrDVpm1vx2NQA==
Content-Language: en-us
X-CMS-MailID: 20260615053630epcas5p2f7154ee25cdcefc604eda766013f90ed
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260612162339epcas5p402cf2406ae41ca7a3c5d4f09163ab872
References: <20260612163020.411761-5-alim.akhtar@samsung.com>
	<CGME20260612162339epcas5p402cf2406ae41ca7a3c5d4f09163ab872@epcas5p4.samsung.com>
	<20260612162335.1F9361F000E9@smtp.kernel.org>



> -----Original Message-----
> From: sashiko-bot=40kernel.org <sashiko-bot=40kernel.org>
> Sent: Friday, June 12, 2026 9:54 PM
> To: Alim Akhtar <alim.akhtar=40samsung.com>
> Cc: robh=40kernel.org; conor+dt=40kernel.org; devicetree=40vger.kernel.or=
g
> Subject: Re: =5BPATCH 4/5=5D arm64: dts: exynos: add initial support for =
Samsung
> Exynos8855 smdk
>=20
> Thank you for your contribution=21 Sashiko AI review found 5 potential is=
sue(s)
> to consider:
> - =5BHigh=5D Missing Required Property in UART node =60serial_0=60
> - =5BMedium=5D Device Tree Topology Error: =60cluster1=60 skips =60core2=
=60
> - =5BLow=5D Device Tree Binding Violation in =60timer=60 node interrupts
> - =5BLow=5D DT Binding Violation: Missing =60-gpio-bank=60 suffix on GPIO=
 bank nodes
> - =5BLow=5D Device Tree Syntax Error: =60gic=60 node defines =60=23size-c=
ells =3D <1>=60
> without =60=23address-cells =3D <1>=60
> --
Thanks, Will fix these in next version

> Sashiko AI review =C2=B7=20https://protect2.fireeye.com/v1/url?k=3Df6873d=
03-=0D=0A>=20970c2830-f686b64c-000babff9bb7-7861d1909a20c345&q=3D1&e=3Dc55a=
9d49-=0D=0A>=2067b5-4ef3-896c-=0D=0A>=2048615db6c678&u=3Dhttps%3A%2F%2Fsash=
iko.dev%2F%23%2Fpatchset%2F202=0D=0A>=2060612163020.411761-1-alim.akhtar%40=
samsung.com%3Fpart%3D4=0D=0A=0D=0A
