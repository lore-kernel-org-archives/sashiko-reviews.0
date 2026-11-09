Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.141
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794223968;
	b=c9pBMgd/x5XBOD/pS5znMB3hS/VUZSB1+eQjrfBM5cezXWxX6ypeH0Oxa9hEmZExQ+sE
	 d4da2CFni+z4fvdQM8S5n3sa0yPPEyOf7oMa73q0xL1Whnd5ykoVt+NEmrETC8MhFfy06
	 KbdIJNO1JtDjcL3yK8ZO7C7QA1D5QKUbvIFNiEepKKxP+Y19FYxow4rvzyV29OQAcymHt
	 doxjF2moseDToYADc/GPDt+adg8Fw5nC7WBHkR4xnPntpzwM7Qjgp+RHOlDo0fNHx0BxC
	 PGlcyNxHItHLlNNph7Wml9AeMg4hG4lhzYtv4PB0lO4dSkNn8AR5PBrtxDrytDRRPCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794223968;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Xqdjx+sIoTks/glyMlCpkSxskUk/OBQ+eUU3z0s7uZI=;
	b=q+mV3e5YqaB/kkZ4ZYrU3+GLSiKmLiqzj15bQKblrMzbTAuw4ahTukq/5jmY+1Lag6aW
	 /dYvx6g/X/+03TuSQ8I8hRiK+8DW6/LS4wtXIKfRJ6C10cibdSxt4McH5hEOVMRT0RrXt
	 5+nzCGvlrO1CHfQKnzlaAKOC0M3kXElnbSsqv95qZUP7y0U3vk41TfPDEuAs0SshZoWsN
	 pUn5UEiEbsptWfGMyiZK1xjnoDDXU1bIRwVuD7TiJNqPuyqT29KE/sOrYNf3ExmrA+XwZ
	 fT8R7AoCrMgxLkRF+qTz+JC5zcWS7bsNVi2xaxGkE6OMakzsfmQvNFrcsolpGpLOG4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=shutemov.name;
	spf=pass smtp.mailfrom=shutemov.name;
	dkim=pass header.d=shutemov.name header.i=@shutemov.name header.a=rsa-sha256 header.s=fm1 header.b=rXGQrCv9;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=rPkAaQQj;
	arc=none smtp.remote-ip=202.12.124.141
Received: from flow-b6-smtp.messagingengine.com (flow-b6-smtp.messagingengine.com [202.12.124.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC07D606A322
	for <sashiko-reviews@lists.linux.dev>; Mon,  9 Nov 2026 11:32:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC07D606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=shutemov.name header.i=@shutemov.name header.a=rsa-sha256 header.s=fm1 header.b=rXGQrCv9;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=rPkAaQQj
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.stl.internal (Postfix) with ESMTP id F3C7413013D1
	for <sashiko-reviews@lists.linux.dev>; Mon,  9 Nov 2026 06:32:46 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Mon, 09 Nov 2026 06:32:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1794223966; x=
	1794231166; bh=Xqdjx+sIoTks/glyMlCpkSxskUk/OBQ+eUU3z0s7uZI=; b=r
	XGQrCv9H1DQ1KeY0P5fWLxfWeX8av0naQqeAzEywS4e7cfuq+S3s08vT/AF9SJ8L
	GEZCYmdSXm4Dn1JSqxQ07kNOUgPcQ2sAufxrZOgwkPU0i292RhfdDsnD5a/6n0A9
	Orfq+kOpieCyhCQFfoLjcLFjzg40DqQm7Qg0h0AxQ6nW+JZ5QSzUgohtRs9GidBh
	4xEmDJtvtUTinut9/QO/gV2uxBzrp43j8ICxWYl3usJGZznvcJIUJjuYYm1h+t7d
	6IBmB4Pl/xqYgJblouLsB229SGtBZAp0p0iSFYiQcQOy2RiGY6qKZXgWtm9MZAa/
	T7VgW2P8IFhITe9x7qWwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1794223966; x=1794231166; bh=Xqdjx+sIoTks/glyMlCpkSxskUk/OBQ+eUU
	3z0s7uZI=; b=rPkAaQQj3kfv1Es4CKUvFt36nHTZq53JmOG7vhYvZId/7PKFcWi
	cDSPnbO1BlM0eOgWCT+U4PZfXxIVcK4Ft1PxvHPj3TCHyIFmm/0+KUGQZRkjtKEC
	lJ3454PB8dh4AFURy6bMXcWcMcXTpn3zKymCmObIn6gGOx+z/HLy1NpjAEmk0qNc
	dRr9BYMVup6V/3cvUsyHqa2vjmelckeCtkOEq8QdrZz3CNmY/ZMGsH/H0fGVgcA4
	BevrM3R/ujM/GovJ3k9TCrYCfHwL7/FAfNugalQT1G8LEPHbvxn6iJzSf0vfEpL9
	nIOxkoaCUCY8xJfL52ryyPU5yT/edFRnDNw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=shutemov.name a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794223966; d=shutemov.name;
	mf=PGtpcmlsbEBzaHV0ZW1vdi5uYW1lPg==;
	rt=PHNhc2hpa28tcmV2aWV3c0BsaXN0cy5saW51eC5kZXY+;
	s=fm1:rsa-sha256:XrmklYuBqUekr377uCpRHgC64p0eLyaP59EldXYN2qxCMk5
	igEpylViB+eidzQf63ZpH59mfk7iqmrDEKqJFf9yZD9hW8dfFyRENH8C5/ysZjnb
	oTM2N/w5fIujeCrqmoDbXrq/8MKOn1+XO8/4YwRxxb+0bxCLwroQr4YotjOsQ2by
	MqQDB5o4ur22riKuJVydlkncyysJ2UsreXCmzOzmgcCeawn5nho52x8+xpNj1ids
	mzuTGERGw3BTiwd955SXUDRgqAe0nAKXCCi/oVxZ9d1SM6FGZtcO6fqmq42j7bg4
	yT70Sqckoo9VEX8RsDY1xc0fO4XnJrFU4XSX6gg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:dr10b/t5AE3MhAk2PKDxOtARndah5JsxsaedpnrJqhc=:QrUxDwEwfWH8+2Fn+5Ww/kuadmo18gKAm3XTyO4BCEI=;
X-ME-Sender: <xms:Xq_xak8LSPQK9_NUmtqxHsELyPAPvGk9pbX43ABxur8o4Tbf8EjO6A>
    <xme:Xq_xatcogKYCSsX_mBNL-dmhOg_Owem3pA_u3dtI_IH_bwOpGnNpZzCMtFlFPfhYY
    mkGjgTsYix0-SFDXu8xSGk2NjmMQu5wQV_r1qSG4APzZfykz4WeBip6>
X-ME-Received: <xmr:Xq_xat3Ma7USbjO2an7dj2YIaZRW15RWWnTU68NBBuj8Ma1kHl-t7raDW4c>
X-ME-Proxy-Cause: dmFkZTEh6LlDTiUv7RQryEzVLCL8YJzMnu9yzeE7W0Ve4XNsg8Veu1FEmxD3SasTEZ8x8R
    LcUsw+eRLyDC5m6FcUi7nJRPzWEBExUVIdgxGfcXD2LeT38moltTtc88L9QdZrsq60nzdy
    ANotKCF7dkMgX99ligefAG3jJHapUzbyIHHq3sarW8DfCPycRmv040jfPW0ufbjSHFq4kV
    ik6QMQnc8p1wmQbwaiEWSjMOwlIEzId1TN7cNbT5O8VtZXoxiNakqy6fZmokLISxiKsXjW
    nGOkn6Ud/YEvA3lasQxI1f7v4ihmImhBBvjIUACmEppK452dKIGlAivfCV0ehVkqZIBABJ
    68KGriS8PCKpVG8VlgWWzyDHt5UvaDNDvPVrHBYB61ZyTSu+jUfrLdIA27/lbBmPl1jfkA
    8GRLltH5UfnN/ei2Z6mI2Ggzz2/Wo42DUR3FTsikofXBSJLGyqPG1vRGffc9WAR9ZmI2MQ
    bf5+IxArlrGeSWdXw2jpTQNzpC94jjVrJQZ0lKfhC0+vuxTamLjeaVAY5dQ15cBHHRzCOw
    SM7xkCd8ueN9ek5WZinFJhoTNziXiFQoBwilbQiFbdZ3vkSR8UncskzJLd4/ftREcw9I0r
    YnoqOgYgbmY6HslKBRY0+s7MsX1ZdgNfcE6byY/4sdGIiwPBWpnE7EJy/bJw
X-ME-Proxy: <xmx:Xq_xamB2yvQv2kVJZo6gBzyzKtCAp11tlpcb1cvN8Qw4t-QCRnU8xQ>
    <xmx:Xq_xaoSalDB_1QevOHimosKvRYsQdPPACR9xBKDIdTa0BIlk9j07ow>
    <xmx:Xq_xaoKIOv9ryFNrePBVB35-GHZXN1blMPmV4RKFd-8PTWo5JOP83g>
    <xmx:Xq_xavHs-8_6jBvQTFvkkKySMaThcGUYNNCnthEm5JUWYpxR8VfUqw>
    <xmx:Xq_xajw_Mbs-V7gw5z0MNhmjdbXgaWQgdEotdKoefhY3lGFd-6Pl7pqZ>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 Nov 2026 06:32:45 -0500 (EST)
Date: Mon, 9 Nov 2026 11:32:44 +0000
From: Kiryl Shutsemau <kirill@shutemov.name>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Hugh Dickins <hughd@google.com>, Chris Mason <mason@kernel.org>, Pedro Falcato <pfalcato@suse.de>, 
	linux-mm@kvack.org, kernel-team@meta.com
Subject: Re: [PATCH] mm/memory: refuse to map page cache folios that are not
 uptodate
Message-ID: <avGvM5kpv_z2ezoz@thinkstation>
References: <20261106144323.3634477-1-kirill@shutemov.name>
 <sashiko-outbox-202966@kernel.org>
 <8cd50b75-0845-4e82-a8ed-acfd3a261a3e@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8cd50b75-0845-4e82-a8ed-acfd3a261a3e@kernel.org>

On Sat, Nov 07, 2026 at 07:17:52PM +0100, David Hildenbrand (Arm) wrote:
> > - [Medium] mm: missing folio_test_uptodate() recheck in
> >   do_shared_fault() mkwrite path
> 
> Kiryl, can you look into that?

Yeah, that's legit. Will fix in v2.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
