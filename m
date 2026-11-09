Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.27.42.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216273;
	b=nwu4vO0PHNHEXRrdTytzBC9zLeSFpsKHiyjL88M9Tk0jLtTmqf/VyMzeBEiHVQv0BpZ+
	 moZYkCXYV+JX7wPGAh6jv3D4OIjX898h7gIt4IpbsXVei1tINvci3xl2bjgh9hPNHMtTd
	 BqA5vQNI5bIMoYq9NBA0ikv1VLAlRNR/mkLT0++rEUOcddCz3Iz4/gTeiikIayffNBETh
	 8AF+Sp8KXlUu3yKCDorlLP63emrTfm0TKMATNMORjZKRUozIk6H48ZLaN5QeyC+QbPfQ/
	 2t7FJX7jvzBUY+M3lW1jklNQeXyJz9JLh6V/Bs2JxTbMAFc2/aD9FYljn8eU1WcSK3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216273;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=6zSslAcgLSDpoJlg4DDhAvmXHB18Ak1qiHeBJZawCiE=;
	b=10MIrf7S7258ojU4IEsBYb2DcWEwvsrV/ZhMTjXrmHFQitSMBx6CexPvmCSEDU0OwPWn
	 opxeL1WF2aKUnJehPZghWenGFzIJEJpTIsviex2GkMPyL2kXoW7Ikm/KZPl0SkANEz9TW
	 3RqtxMfnd2PlnY3e2IhZIdtYrdWTI4WNza+ceGrXF+0pJCfR9/VKccwapZESGi4HCCTaJ
	 dGOCy7yM2kwO9mq8NxbWySan8PbA87UKs1My0S2ZXVLs6pSXlFivVBWw++fhmHQlhujZP
	 YZmU5r98Gxlbcp7Dq4ATijxWdnzeeeruUi1tVqhKqmQIuwg7+ECB9t0p2rED9bTS+BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=free.fr;
	spf=pass smtp.mailfrom=free.fr;
	arc=none smtp.remote-ip=212.27.42.3
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF4E606EEB1
	for <sashiko-reviews@lists.linux.dev>; Mon,  9 Nov 2026 09:24:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDF4E606EEB1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Received: from L30177.local (unknown [82.65.104.223])
	(Authenticated sender: vjardin@free.fr)
	by smtp3-g21.free.fr (Postfix) with ESMTPSA id 00DCF13F88F;
	Mon,  9 Nov 2026 10:24:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1794216253;
	bh=4CPZ+2D+MohnvaVvAPW41N5ZGuWYUqT+prNnmrrnU/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LuApu94a/jIJ5ETrgixMMjj+1upOLRTfD1qB3ZoxLYnWm7zhUD3qM8eKTzrHeYKNS
	 8WZ3iq7U4sHdOtlOPzlrZ6kypytrAMXpc868xBlprcJkRuq6gSWSBV+e9Df/CwQcEI
	 9Fq9S+6cor1E7Y1fXwXVcd8qeJx8c3LTR6waH97hq4/M8me3Jw42DcE4TN0mjQ2GiA
	 H013mkF6bBEwshi2vCiA5VnnhlWkX30ksQa2eq+CA1lAfYAdYJIA+t4IlpJC5kilel
	 KdPS8LXyhVoW6EtBI8F95p+eBL8ai5LiTuV8DTJB/qExzuth33HG5GvQb3KQNLW12f
	 JfYKRwxBpkWDg==
Date: Mon, 9 Nov 2026 10:24:04 +0100
From: Vincent Jardin <vjardin@free.fr>
To: sashiko-reviews@lists.linux.dev
Cc: Horia =?utf-8?Q?Geant=C4=83?= <horia.geanta@nxp.com>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	Sahil Malhotra <sahil.malhotra@nxp.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	linux-crypto@vger.kernel.org
Subject: Re: [PATCH RFC] crypto: caam - never share the gcm and skcipher
 descriptors serially
Message-ID: <avGRNCLts4SX3NgX@L30177.local>
References: <20261109-for-upstream-caam-shdsc-share-never-v1-v1-1-65a1dd146db2@free.fr>
 <sashiko-outbox-204176@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-204176@kernel.org>

Hi Mx Bot,

> [Severity: Low]
> With HDR_SHARE_NEVER, should HDR_SAVECTX and the JUMP_COND_SHRD jumps also
> be dropped from these four descriptors?
> 
> All CAAM job backends defer sharing mode to the shared descriptor header,
> so HDR_SHARE_NEVER disables descriptor sharing across jobs and JUMP_COND_SHRD
> is never true. Keeping key_jump_cmd and the JUMP_COND_SHRD branch in
> append_dec_op1() called by cnstr_shdsc_skcipher_decap() leaves unreachable
> instructions in the descriptors that waste space and DECO cycles on every
> job, and HDR_SAVECTX only applies when a descriptor is self-shared.


Right, both are void under HDR_SHARE_NEVER: the SHRD condition never
holds, and Save Context only acts under serial self-sharing (SEC RM, HEADER
command).

They are here on purpose for this RFC: to focus on the change under discussion.

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261109-for-upstream-caam-shdsc-share-never-v1-v1-1-65a1dd146db2@free.fr?part=1
