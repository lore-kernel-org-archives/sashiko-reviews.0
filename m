Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.105
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792524493;
	b=MoreHmVU3WGAnP2fqP2uyiMpquaFnh7a8gzVMu3AUEu8IH7msOravo4NlB1W+0ILIFzj
	 dRN7yZaHSg4udY5CIaUxHwxIaPPGeDvVckb5/4gdpsLNpK1n9hvNY/EkaAw4Jucb5ARk4
	 /aUP5Ubqc5I4Mr5QrfJ7DQM01Y17WhL1j65eD1rfa8FxpPdrHNLatzNVQ6xK/6JNPsVPI
	 Db2TzAz9+8TGAAqzhdZgY3eW5h9q64NMZ0dAW1mvrV9xb4H40fAzExi4/nzZ3UDoYA33x
	 OSMr11JOSzIE4vu4K0RWtp+8U9e2sG48PUIEs951KIpez26iu8rCP9lJ3dD8y1kdm+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792524493;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:Cc:
	 In-Reply-To:References;
	bh=nhw4NeSU454BOKwhnUyqxz9y3bQlniVFV2xnSR9NZew=;
	b=hRcoxO9izcip4REZp4/oW+Omu831LKh6mFHylFp52ECRVyXoLssXiI6YMjZZ8bz4qHcc
	 FjN7IOdAeAPMwyM9vRdee00JApPDDFb7pkzSdiPFW3uw4kSQFBevavmYwgMPYYmKYl/vn
	 UE4r4iLInugdhSzNtwYDCn9Izm43TVoWgc/RaWITAD9p5SZUQMphFaScc8F/OJQGutptV
	 N2TYERb0hOvlcxCqD5YiV4NL/Xifh/0TJC158jv1hoz04yqoTDOaqueBpuSdDjjgsHQmR
	 KuYh74/65G8TXoQBAZxbMLyHF9I4z98NbG6NHQuE7o7BmByxPyNElzBCJ2yMnvhbZcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=postmarketos.org;
	spf=pass smtp.mailfrom=postmarketos.org;
	dkim=pass header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=aE7p0YAw;
	arc=none smtp.remote-ip=95.215.58.105
Received: from mta1.migadu.com (out-105.mta1.migadu.com [95.215.58.105])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75281606A31B
	for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 19:28:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75281606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=aE7p0YAw
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=nhw4NeSU454BOKwhnUyqxz9y3bQlniVFV2xnSR9NZew=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792524490; v=1; x=1793129290;
 b=aE7p0YAw+as7Xca7qxj1PFyCXZH/6PMfqTFoMsmKByNBawbEKO39gV1rHSbijQR9J6Cm5Sye
 uWez+Yep/7mfxb6MP7l9TBvANeEaU/37/EgSYkz/PBHiKYl3jzHBO25kN78CJ53xBdIeU1kbMk/
 73nlKT4L8BDoMJnZOZ+D7BAP97ZBpSCfh+ecWcd5ibZADv0qI+s7aGOUgkMQ+FkmtOPyzFuZAiI
 qLCDO+Tw9CUlBh3sKXDP7PHbRXyCgAnKAUYNXQlN+c14IKtm1CkQ72w5kwjdY/Xgf0593QzvNEd
 OyevAN2A+M/EtELC1txBMF6tIo2c4MwuQQO1z9wtb6R+Q==
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id d89a57325dc7bec0;
	Tue, 20 Oct 2026 19:28:10 +0000
X-Mizu-Trace-ID: d89a57325dc7bec0
X-Migadu-Flow: FLOW_OUT
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Date: Tue, 20 Oct 2026 19:28:09 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Paul Sajna" <sajattack@postmarketos.org>
Message-ID: <338bdb9dddd9cf502a05ae8a79ccf5bb368b37a7@postmarketos.org>
TLS-Required: No
Subject: Re: [PATCH v3 5/6] leds: aw2013: Prevent writes to unpowered chip
To: "Lee Jones" <lee@kernel.org>, sashiko-reviews@lists.linux.dev
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
In-Reply-To: <20261020101654.GF1206986@google.com>
References: <20261012-aw2013-aw20xx-rename-v3-0-cab1fdd050b6@postmarketos.org>
 <20261012-aw2013-aw20xx-rename-v3-5-cab1fdd050b6@postmarketos.org>
 <sashiko-outbox-169017@kernel.org>
 <20261020101654.GF1206986@google.com>

October 20, 2026 at 3:16 AM, "Lee Jones" <lee@kernel.org mailto:lee@kerne=
l.org?to=3D%22Lee%20Jones%22%20%3Clee%40kernel.org%3E > wrote:

> >=20
>=20No more reviews until Sashko is clean or everything has been reasoned=
 about.


Thanks for the review, wasn't expecting anything until I fixed Sashiko, j=
ust didn't have time to circle back yet.
