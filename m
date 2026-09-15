Received: from mta0.migadu.com (out-70.mta0.migadu.com [91.218.175.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8578F485CD6
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 11:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789470845; cv=none; b=WOMjo37OeyBZadc5bfrFwfp7S99n2ebmMDZOf+OT6xoHdkd8Z8T0U5X75QiK1JrljW8ERsWAXiampmT4kLO4AidJK3qW6+9saJT5WBRu05/OQCDY6YXL3iiNccJhhXVes/ERFowtPTnfakSK/Dz4Y7IeDv7qGPd4IGFwGBd3zto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789470845; c=relaxed/simple;
	bh=SAmWWDy6uJ1HUX3PogDksPgipTl5TLTj6F5gv0iM4ZA=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=PlUkmUIg7boMCpoSicfXSbUmFMuql8B2cDQQ7COjBRXfNwJ0n6WvjzYBjjzn1TZ8SxsI1SbebR3NKIwvhaO6FowktS1oIQkByPzwYPaVsDL9Ac1cplh7CeW5XUVzICLTIkOxZJh4HhyomgFdbzQzq5u6AVRMkrlxaUF1wo6NJzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=DHyOhi7P; arc=none smtp.client-ip=91.218.175.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="DHyOhi7P"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=SAmWWDy6uJ1HUX3PogDksPgipTl5TLTj6F5gv0iM4ZA=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789470840; v=1; x=1790075640;
 b=DHyOhi7PJBLhTS9eHuo4KzOlzXhO/jSYFSPItE8IeUcLlPIRdFhuMBsKTBL3Lu0oYLj0beR6
 Z3pBn/ZcPmTUWFfRF5ft/ZCwfTB0p6pnZmf1QKkI7bqWcRnPbXslFLk2/Ex363OpXunX9RSxj3L
 LMSsrybnB0+J7xgrowjYCWgIyjk9YzeBvztFQll6sR8mmE1F6S19RxYeY+S0DKRLwal21Dss3Gr
 SyOLH9xyAWkuYk1O81KYvlwAwGjafxxs0esdoJ2thEJvSMJpqEprvTsgqU6S7Z1pY2G9ERRPQoB
 xqFmib2zxVOFO1AiW9Oso9ov/B2SsRs6G32Wk/L5JEJnQ==
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 56136512ff7991f7;
	Tue, 15 Sep 2026 11:13:50 +0000
X-Mizu-Trace-ID: 56136512ff7991f7
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 15 Sep 2026 13:13:45 +0200
Message-Id: <DLFUGSHJFYH8.1NFX2YZ9J7EMA@cknow-tech.com>
To: "Diederik de Haas" <diederik@cknow-tech.com>,
 <sashiko-reviews@lists.linux.dev>
Cc: <robh@kernel.org>, <conor+dt@kernel.org>, "Heiko Stuebner"
 <heiko@sntech.de>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Add support for FriendlyElec
 NanoPC-T6 Plus
From: "Diederik de Haas" <diederik@cknow-tech.com>
X-Mailer: aerc 0.22.0-9-ge948bb7230f4
References: <20260907122406.1862398-1-diederik@cknow-tech.com>
 <20260907122406.1862398-4-diederik@cknow-tech.com>
 <20260907123459.B96191F00A3A@smtp.kernel.org>
 <DL959BBXDOAZ.2RNX9SJVZIKPK@cknow-tech.com>
In-Reply-To: <DL959BBXDOAZ.2RNX9SJVZIKPK@cknow-tech.com>

On Mon Sep 7, 2026 at 4:12 PM CEST, Diederik de Haas wrote:
> I have a MT7925 M.2 Wi-Fi+BT card in my NanoPC-T6 Plus and while
> Wi-Fi looks great (1.4/1.9 Gbps connection), BT has been horrible.
> Similar story for my BE200 M.2 Wi-Fi+BT card I have in my LTS board.
> And the most annoying thing: it's behavior is very inconsistent.

FWIW: that was caused by a broken and a severely damaged pigtail.

> My cheapo (cherry) BT keyboard works fine/decent and connecting to my FNB=
58 USB
> meter over BT is great. Haven't tried anything useful with that latter on=
e, but
> it consistently finds it and when I connect to it, it succeeds. It even s=
tays
> connected \o/ :-O

And those worked (somewhat) because of close proximity to the chip.

> All the rest? It either doesn't see it, it can't connect to it, or it
> connects to it to drop the connection after a few seconds.
> And after a reboot? No one knows what will happen.

After replacing the pigtails, Wi-Fi works even better and BT works really
good as well.

> I've had ONE time a stable connection between the MT7925 and my BT speake=
rs.
> Only it didn't show as a sink in pipewire/wireplumber so I couldn't actua=
lly
> use it. I haven't been able to make a connection since.

Connecting to my BT speaker (thus) works great now too, but it still doesn'=
t
show up as a sink in pipewire. But that's either a driver or a pipewire and=
/or=20
wireplumber issue. HW if fine :-D

Cheers,
  Diederik
