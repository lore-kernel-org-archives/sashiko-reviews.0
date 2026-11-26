Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.145.95.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686511;
	b=CztxE7b4ug+Kmi2R89Tor8BJ/E7SX3JAXtGoszsK9m6hs+vAy92miUk/A5soxTIxk8r+
	 PtDiNC05en8Ebb8cpXYrcfnJVHd7dzjiYfd45+3wNslyQfJ8oJ7/b5aj5SSBiapzO2dvh
	 cqvHhK+Q8q6wnzPcLLDgrwvrsFuSrdqxRnXqYqxM01bt6J0KrxpV3amroyVdhAb8jffF0
	 OHkPU/Xd78LmdfQfgApPvHerRQTUUonYVuy2Jx3RvambpmVA8oAzx5wWbigjetwBYReFY
	 2k5ywko9EdKfYiG1HikGD93yYe313uC76PWbchqVFzOecZAMT4XB/Zpt0wTv9E3YtVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686511;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:
	 References:Date:X-Clacks-Overhead:Message-ID:MIME-Version:
	 Content-Type;
	bh=6cgl+cJCPo6MGV5UvUz5o9puShPO80wHEGZQxQESbN4=;
	b=t2izqBAjIWQhVN/+rqPyBPE0FLpCHyANa/y9Go1xKEJ/0XyXebbOPoFqEW+pztP8E/Xs
	 TSnzosgudXzJo4YwLB+4jnslmu5mkDrKKT+O8+pDsm0l78hVnBq3Izm37HX8LnaG7eCYe
	 IPWLLo2prvjBIQRgW+39O/Di2Y8okMzXGY3i9cgqVpFA27pJLMJIOh3UJfw75oGPd1N+n
	 Xfb1skRF1EYqwTAty/fR81HDiIL5TH5squs0pGx7Q+cEbotg6vNbcsae4OWUIA6VV0DxY
	 GcEUQSVKnkgtLb4jm6E0CN15n0TfvQIJqUqIwWQWhsyuiqy0zaVTlnCTiNE6jPtMBvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=toke.dk;
	spf=pass smtp.mailfrom=toke.dk;
	dkim=pass header.d=toke.dk header.i=@toke.dk header.a=rsa-sha256 header.s=20161023 header.b=nrOIkOBD;
	arc=none smtp.remote-ip=45.145.95.4
Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4761C606A31E
	for <sashiko-reviews@lists.linux.dev>; Thu, 26 Nov 2026 09:48:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4761C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toke.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toke.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toke.dk header.i=@toke.dk header.a=rsa-sha256 header.s=20161023 header.b=nrOIkOBD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
	t=1795686508; bh=nZGt73YLaZAHBOiJWhisNMK8lPIrbp3MkoNI3ZvYB9E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nrOIkOBDVbuUfJw1NDKoMEnjqARSAUagsEPzRwpTkwCzZaQ2qm5HPWtadL1G42hcE
	 nJG2PXz49Hx1zPpL9B3AiIMRb9n+L57d54cn0MksLZvlp7r1SIPX1RZWX2fiyQBlD6
	 MLCcTJH1JFMoJlazJaR1pbcZ/+T20lpCzykd7xtA0U21G1gbUbTizdYOhOeHGBHsxX
	 SIZhM8gq7Cqh9KatluasrOXwU0Q1v13GSI0tgU58Ezlen45EPiT2K6JhdFMO11A6Jr
	 lW3Dgv3hrP5ToOty6sELAMc6U7tVGy8nOIcX0EDwNpBX9ZoouhdeS7ueYcivl8NEu0
	 JOo3RWlS7eXlw==
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH bpf-next 2/7] libbpf: Add bpf_*_get_next_id_opts()
 functions
In-Reply-To: <sashiko-outbox-233673@kernel.org>
References: <20261125-bpf-relax-get-next-id-v1-0-49175227c8cf@toke.dk>
 <20261125-bpf-relax-get-next-id-v1-2-49175227c8cf@toke.dk>
 <sashiko-outbox-233673@kernel.org>
Date: Thu, 26 Nov 2026 10:48:27 +0100
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87zeuvditw.fsf@toke.dk>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

sashiko-bot@kernel.org writes:

> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] libbpf: wrong opts struct type in OPTS_VALID() in
>   bpf_obj_get_next_id()
> - [Medium] libbpf: new bpf_*_get_next_id_opts() symbols placed in
>   LIBBPF_1.8.0

Will fix these and the other issues pointed out by the bot and respin.

pw-bot: cr
