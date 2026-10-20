Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=13.77.154.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792470653;
	b=Dmsy+Gwn9W+357BnOFOlMOrJDQ9wimoXcGiUlr63+OaSX2xocBkj9ctkf6TLcScqECMy
	 l0pf78CTOhPn38WOLlP7WQ+80zfKU5xV9E/XcaB8zg9vvbGRRUm9/wQjmps6e0HgkK7P/
	 14kZCccqN5dUHGBfaeM6bA3jrNDTolBa/v7tjw68uL2W2diTCMdDoc4ijk+dB6xI/DowZ
	 QI6f0BEwpdhaKAh2/RnTBYSHcxuO34J3bSWIZjq9uPmKwR3aLtveFzXE+ZkYtfKPEB7UQ
	 NrYNHOgnBK66oEunU/SrDCvAm0LIDwbvlheooYC5NXlNUqqcH1OQlTGIxia/FvocZTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792470653;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:X-Spam-Status:
	 X-Spam-Checker-Version;
	bh=GUy/xzBZGPagZZn/WQck+ql2UBUZUe5Sbx3c/m790fs=;
	b=reFvOG83j6mnFqviYFogv59ijtOasinmnLbkRTxh4WTd/uINbnBylXNT61jn07kvNc/0
	 7OU5gKNGL/ri/D/Pm7a7kIkwxvCL8FGZcwTxOIAd0N6Y/+4lAvVli0rypYqhOwct0SsCN
	 Y7INtA1wuPDxlsT70BcDKw8bZTHZIaV125YAd76EwasD2CEpQu/xVXdE3isPuz+Ta9kf4
	 I6WwvSmsQHSMVbe9kBrhwsMWjYnSnH4gbdJXSRbli6bho01H3noilfIoQYH0maQ/9WCv/
	 c/EjJ5NglcBOWuJLo2uTnhWb0Yc+WMQ1u2Lwm5GP6cMxRT8jTclGrr4AVOjWFj8G1IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.microsoft.com;
	spf=pass smtp.mailfrom=linux.microsoft.com;
	dkim=pass header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=quQjRj6c;
	arc=none smtp.remote-ip=13.77.154.182
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDD10606A32F
	for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 04:30:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDD10606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=quQjRj6c
Received: from weh-cvm-dev-vm.y50bckvjo0hefgfnzfztsfttff.phxx.internal.cloudapp.net (unknown [20.169.55.37])
	by linux.microsoft.com (Postfix) with ESMTPSA id D772020B7172;
	Mon, 19 Oct 2026 21:30:43 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D772020B7172
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1792470644;
	bh=GUy/xzBZGPagZZn/WQck+ql2UBUZUe5Sbx3c/m790fs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=quQjRj6c6EZvljRRnAfURE4+hQoQx4Q5gCFslrhfUW4j6jdKJNR6kdI2u+KS8Ta1V
	 may3NWnVufFkgqY0gZaEXSyM1FjA//KEUMd5BPuVlk4kMtT3SOJWWSe34VOJN21WD+
	 4UYjtMjtZ6botHve74ebtkD5z6lHNySUMlGd+Qug=
From: Wei Hu <weh@linux.microsoft.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-rdma@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	weh@microsoft.com,
	kuba@kernel.org
Subject: Re: [PATCH net-next v7 06/13] net: mana: swap queue sets in mana_set_priv_flags
Date: Tue, 20 Oct 2026 04:30:41 +0000
Message-ID: <qset-v7-sashiko-06-v8-plan.20261018.weh@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-175606@kernel.org>
References: <cover.1791710735.git.weh@linux.microsoft.com> <c1a2032792858ac0234807bbb5b26b81af4d10b1.1791710735.git.weh@linux.microsoft.com> <sashiko-outbox-175606@kernel.org>
Content-Type: text/plain; charset="us-ascii"
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

Hi,

> Does this code introduce an open-coded trylock pattern?

I will keep the existing synchronization in v8. channel_changing is a
vport-admission reservation protected by vport_mutex, not an unprotected
replacement for the serialization of Ethernet reconfiguration.

RTNL serializes the Ethernet reconfiguration and reset writers. The
reservation remains set while the rebuild releases vport_mutex between
individual vport operations, so concurrent RDMA admission through
mana_cfg_vport(check=true) can reject that interval under vport_mutex.
The success and failure cleanup paths clear the reservation under the
same mutex.

Holding vport_mutex over the whole rebuild is not a drop-in replacement:
the vport configuration/unconfiguration helpers acquire it themselves.
The report does not identify a missing exclusion edge in the existing
protocol, which is also present in v6. I am not redesigning that protocol
solely on the basis of its resemblance to a trylock.

Thanks,
Wei
