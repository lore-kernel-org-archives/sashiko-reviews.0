Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9F24B8DE8
	for <sashiko-reviews@lists.linux.dev>; Mon,  7 Sep 2026 20:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.221
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788812984; cv=pass; b=n+/rzE6W4naFtTxpw5gLS37bWLkBdnjoj4+f2nUaHJKyGaf6bpQws6Glbg7R1OT4wCmpH8JgnJvuy1b8Qce4YPRTU9OrKwKG+Cv3W4S/pDTC1iD8dXr77Q1AQgbSDGaQbj7+rLk4blU3n4WEWXEm1rp4mnAUaRFYST/wjIXpAVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788812984; c=relaxed/simple;
	bh=xxJyQx6ub86H6TYXl1ZpV7W3dnK0s/09Kt0zag28lNo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HjJ4L6h2BxZVLnKory/WskVq6Czl+M2b0gUUzrlMTGBsvjmTDGaqYn2gla6MEucnYQEWtJFeDjDw5m26kpYy/PU0jgpgHPD/9ZS+kqAbFmot3vqM8fErooCiyTaTGwlQWWzwbuMCifnCWrbU3B8exYADLxC6Sp71UQ7ETaAytEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iokpp.de; spf=none smtp.mailfrom=iokpp.de; dkim=pass (2048-bit key) header.d=iokpp.de header.i=@iokpp.de header.b=D1o4PQPi; dkim=permerror (0-bit key) header.d=iokpp.de header.i=@iokpp.de header.b=sbD5YJ64; arc=pass smtp.client-ip=81.169.146.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iokpp.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=iokpp.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iokpp.de header.i=@iokpp.de header.b="D1o4PQPi";
	dkim=permerror (0-bit key) header.d=iokpp.de header.i=@iokpp.de header.b="sbD5YJ64"
ARC-Seal: i=1; a=rsa-sha256; t=1788812601; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=kb6h9xKnSFprFfQdm/glbiXbvM2O3SOO+4nBQI/+NhudCjar7nm9XQm85lCMrKgByV
    9h/dPG52XDVAmQn2xHxr0gbvAM06xrULlbv/V1lGpSPT52+vv9BCyw1qmTF+hE3RD2jy
    cT0b0P7xxXMXL4xVc0Ham/dm6j/Id9f69yHC0f7Gp53Zmgc/UoLtyc+wzbGKWYX65jwm
    uj88Q8bY1ImBedQGKK4FxkxjEJjXgSgXLYN3RmoyTJEt2H1rUphXpI1A7P/AgAJzJ4UY
    /Rh+EHf4P3zSHC1Gukp188HILfjz+lEyNAUuDix5xYb9LF9JeyKTnI0Bm7uy87JFaHj4
    5tlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1788812601;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=xxJyQx6ub86H6TYXl1ZpV7W3dnK0s/09Kt0zag28lNo=;
    b=SutiOQlBC91OBUEWaxQg89Mu508gibhdQmG2vXw91vElWDjTHUKLxyg0ViUCFJRZ+c
    NWtCryTBuUkgBeS6a1D+NIm4lMt/OA5Gen3vpMK08VaAbKeM6arV+jDLajhG3tQACM1Y
    Vuri46ziTkeWPS9Jl2PnTXeKW98r6r/uQ06b0S3XJUt3GORMO32YcweJM0Q4azVDErHT
    DcoQSQ87cKpmHXQ4DTniwvaTaCXQcntzWRN054jAUI8FPc4Tp/DusbZ5PD7akLv624S4
    G3wNqugXr1iXV4dXByyignz0Kmzh0myXubo9OBTZNJsyxmKC7BKYbTZMoaAqx6BPbeHh
    9mUw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1788812601;
    s=strato-dkim-0002; d=iokpp.de;
    h=References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=xxJyQx6ub86H6TYXl1ZpV7W3dnK0s/09Kt0zag28lNo=;
    b=D1o4PQPi3IwIQXg3plpzd6WJ4KBZrcCioRjTyNZbjd/GrZ4UJZPJILKanVdkeKmJjE
    qWTXAh9p5uSAH396ml3l2fnV+jndL8CmsCvRPXHOI7xmq/i3doTOALDSuCuRhp91g7kI
    oz0pNE/wICb0iNG01P7Za0veX240ZMtf1cDF7CJ2ujTZhSa6oLJkon779ccNDquyFWEA
    l/kynI+tLTX2CtDaoDAAoY1KrwVyR3uttI2/RyKBh0eG1lARrzkoo5WrycRGnvvy8Lsf
    wUode+2IszWWJ8mqkDQxngC8VzAqzDgOVKbN9HLxFDCPF5LfUQkOQ6eISne6aujdWa2R
    dLAg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1788812601;
    s=strato-dkim-0003; d=iokpp.de;
    h=References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=xxJyQx6ub86H6TYXl1ZpV7W3dnK0s/09Kt0zag28lNo=;
    b=sbD5YJ64/BK1M8QwzjI/S1zwpidd4qUfNz6PO2OTbF6aL6Dj+bT91C2Qoehe+DK9C3
    GdCtTABmhR9tLyAYh2BA==
X-RZG-AUTH: ":LmkFe0i9dN8c2t4QQyGBB/NDXvjDB6pBSe9tgBDSDt0V2DZ1j3VzZR8ZYnVF9Wg="
Received: from [192.168.65.16]
    by smtp.strato.de (RZmta 55.6.2 AUTH)
    with ESMTPSA id ze37e1287KNLCyl
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Mon, 7 Sep 2026 22:23:21 +0200 (CEST)
Message-ID: <0a6df3b31f56265807df98997aece161025fdb1a.camel@iokpp.de>
Subject: Re: [PATCH v2 4/4] scsi: ufs: core: Report the current clock
 frequency to devfreq
From: Bean Huo <beanhuo@iokpp.de>
To: sashiko-reviews@lists.linux.dev
Cc: linux-scsi@vger.kernel.org
Date: Mon, 07 Sep 2026 22:23:17 +0200
In-Reply-To: <20260907193533.6919B1F00A3A@smtp.kernel.org>
References: <20260907192140.2701755-1-beanhuo@iokpp.de>
	 <20260907192140.2701755-5-beanhuo@iokpp.de>
	 <20260907193533.6919B1F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.4-0ubuntu2.1 
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

T24gTW9uLCAyMDI2LTA5LTA3IGF0IDE5OjM1ICswMDAwLCBzYXNoaWtvLWJvdEBrZXJuZWwub3Jn
IHdyb3RlOgo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCpmcmVxID0gaGJhLT5j
bGtfc2NhbGluZy50YXJnZXRfZnJlcTsKPiAKPiBbU2V2ZXJpdHk6IExvd10KPiBJcyBpdCBwb3Nz
aWJsZSBmb3IgdGhpcyBsb2NrbGVzcyByZWFkIG9mIHRhcmdldF9mcmVxIHRvIHJhY2Ugd2l0aCBm
cmVxdWVuY3kKPiBzY2FsaW5nIHVwZGF0ZXM/Cj4gCj4gSWYgdGhlIGRldmZyZXEgc3lzZnMgY3Vy
X2ZyZXEgYXR0cmlidXRlIGlzIHJlYWQgY29uY3VycmVudGx5IHdpdGggdXBkYXRlcyBsaWtlCj4g
dWZzaGNkX2Nsa3NjYWxlX2VuYWJsZV9zdG9yZSgpIG9yIHVmc2hjZF9kZXZmcmVxX3RhcmdldCgp
LCBjb3VsZCBpdCB0cmlnZ2VyIGEKPiBLQ1NBTiBkYXRhIHJhY2Ugd2FybmluZyBvciByZXN1bHQg
aW4gYSBzdGFsZSByZWFkPyBTaG91bGQgdGhpcyBiZSBwcm90ZWN0ZWQgb3IKPiB1c2UgUkVBRF9P
TkNFKCk/Cj4gCj4gPiArwqDCoMKgwqDCoMKgwqB9IGVsc2Ugewo+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHN0cnVjdCB1ZnNfY2xrX2luZm8gKmNsa2k7Cj4gPiArCj4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY2xraSA9IGxpc3RfZmlyc3RfZW50cnkoJmhiYS0+
Y2xrX2xpc3RfaGVhZCwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgdWZzX2Nsa19p
bmZvLCBsaXN0KTsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAqZnJlcSA9IGNs
a2ktPmN1cnJfZnJlcTsKPiAKPiBbU2V2ZXJpdHk6IExvd10KPiBTaW1pbGFybHksIGNvdWxkIHRo
aXMgbG9ja2xlc3MgcmVhZCBvZiBjdXJyX2ZyZXEgcmFjZSB3aXRoIHVwZGF0ZXMgaW4gdGhlIHNh
bWUKPiB3YXk/IE1pZ2h0IFJFQURfT05DRSgpIGJlIG5lZWRlZCBoZXJlIHRvIGZvcm1hbGx5IHJl
c29sdmUgdGhlIHJhY2U/CgpUaGUgcmVhZCBpcyBsb2NrbGVzcywgYnV0IGEgbG9jayB3b3VsZCBu
b3QgaGVscCBoZXJlLgo=

