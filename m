Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792740859;
	b=1uM6ADk1mff7yspVzeFPXZkKuDkBa0+Ixbck+A2v6LBUbl6p/J4JG6IET1KtVDAZBb2s
	 ojUdlBILwa0t9EnMt4cAwsDqhbkTyV9tmC3fkB1dHO3BkTRUv1aJI+fik+Ky8Q4EtxEL1
	 jUM8B4mOgRHO4tfMjVmQ8oO2dWUQTvhZQRLLY6ePsbmTwi5Gzo18+jAv7Qhd7coR/8Yut
	 FHmxifufm0lT+IDR2uQx1u7ALs4UpnuKVrZoxgIscLXOgsVsNkbXdPB6NT+KK2gd6mbOA
	 +8igvOHVBn3pDEX5bJeLUzmQ4aUPNeJTGzIRvY+tJuTExff31NMVd4LqXvoNNkghxYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792740859;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=Oyxbvr7lEIaNAb3MoGhHVG5ZkYUYaADS61wDhzBXdXs=;
	b=L2soX1rheKF8oDxyrrDGGRQuRIFl2aeA3aIX3eNpxSz8Dto7QMHYpfEFEJCxL6b56Lr3
	 d3loiR7YzZWEtiePLhxG0Oz50Hjx2Actj4F2LFLJmJajU5tLZGtEFUrrEmGZTt4RmrsjQ
	 wfvGfqjcyodC15ADAB+Tmhe/hCYYAtxp2TGahv40bA98tYXgUPn462iLD8fYqTs9E1g3x
	 GpQuTXF7NT9OK16fpHosPPhWgROfqAmZPvH+9nMEvyzmON8Kq2jn7jx1F4IqDahH3TtIZ
	 PKarHRs9iksVG3T90LTOJUMn1iOP63fnJtnu4fUt1cKPcWqNtoer749pfKidmQKXLtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720FF606A31A
	for <sashiko-reviews@lists.linux.dev>; Fri, 23 Oct 2026 07:34:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 720FF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Oy
	xbvr7lEIaNAb3MoGhHVG5ZkYUYaADS61wDhzBXdXs=; b=mZVO7Vx+LImU6LbXSg
	ipEFyUj3USBcHrCD3UrZc0ZvrEyUFYkJ5n106Q9THDA+mwqxflQXhHNLx7bjcGrc
	+suHSkpGyn0JBJy3Fs50Vm6n6DkulPqP3gPgNKnKE7P4AzgjKlxYhb/JCeNYt0vp
	i/1Hl6S+Lq4LZ77FQYRoOZaZE=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3nxfnDdtq5rowCQ--.8275S2;
	Fri, 23 Oct 2026 15:33:59 +0800 (CST)
From: Feng Yang <yangfeng59949@163.com>
To: sashiko-bot@kernel.org
Cc: bpf@vger.kernel.org,
	sashiko-reviews@lists.linux.dev,
	yangfeng59949@163.com
Subject: Re: [PATCH bpf-next] bpf: Fix out-of-bounds btf->types write for split BTF
Date: Fri, 23 Oct 2026 15:33:59 +0800
Message-Id: <20261023073359.642990-1-yangfeng59949@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <sashiko-outbox-182361@kernel.org>
References: <sashiko-outbox-182361@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3nxfnDdtq5rowCQ--.8275S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjfUeUDJDUUUU
X-CM-SenderInfo: p1dqww5hqjkmqzuzqiywtou0bp/xtbC8QgPh2rbDegT7AAA3a

On Fri, 23 Oct 2026 06:46:07 +0000 sashiko-bot@kernel.org wroted:

> [...]
> Should btf_check_all_metas() check and propagate the error returned by
> btf_add_type()?

The previous patch at https://lore.kernel.org/all/20261022064727.747304-1-yangfeng59949@163.com/
has fixed this issue.

