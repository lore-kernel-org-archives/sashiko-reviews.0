Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793711476;
	b=wOixYIhS/CNhbPBtHEsQqEBRDEMnt8k3ji2E0mloXvNvF8DYbzy4EOH3CBe1eL1B/yAh
	 JiqPWFZQ1m6GoTdTKX2uFrjENM6YNlXGCTGB5Wu+wtG5Purz+jgEWCEtpBZs014uxhZht
	 ENcgWSQXSE5wRn9Jbq5TlR2bTN0RYrcVZRRKHJxvlZDGZs//D+tf12gcaR/DX8RLT7NWO
	 HJXMYRyWpFeMuqSFmHLe/IG37AXLnJY7rEeHxLyaUmWBUm3JhEpYceXd77MK2Je3DP+yZ
	 Mm4Ebl2CWAFOLUbO2isL8NCeZgIpGqqtaWMzib3eB+OX7aonGP9KURed131C9TkZlfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793711476;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:In-Reply-To:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding;
	bh=0smI/wkIKBhttmjun844YlQk8k5yNcKMLGY89LEOpsg=;
	b=qq0+dPEMqpMMSP9VjM5H9+WjbVu1VMWqCJOpi3bG8Z4TsXMNOw7rU7N9g/2GKTLIMe2v
	 KxmfjeKqyNsCltYlB4xXdq6Z2a5COY6GyuE43qjR1tjfSGz1akBHv6QAY4oVWlqcBOBp6
	 WTV9a1tUaukKVPh+w4ezGQRxgHDjMkECxS2TCZwCTi87PkI0BXYn0tiLd/VJntQyFyISD
	 M95q3gXOPwuUJ7eUM7BpYLpsBvFa1ZzAsTrhXsqW6nb3EsF+GeVqa+s0iBKU10Rxjmrby
	 6TukepID6T7n0mt5DPIIT+EnSjU3PBM/jZKMrc6PC6gbf15y4Fg9nE13DPwGUFF9Zww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jEVz+2SP;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7C3606D83B
	for <sashiko-reviews@lists.linux.dev>; Tue,  3 Nov 2026 13:11:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D7C3606D83B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jEVz+2SP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793711475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0smI/wkIKBhttmjun844YlQk8k5yNcKMLGY89LEOpsg=;
	b=jEVz+2SPYF/43d4+wuOT3mSF5a/phDPfKHDdPLlabriOiYFYua6HEGUWn829Op6aw33CRE
	Vg9dwTs5tSWUU+CueBSRC5TnDIXP/t1YwlIReqFCRn210oZPohZqOKlZIUIGZClKCb+kmS
	o6dTWKwuXqXye30+t2aJJnXZvoDvR4U=
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549--XTsJcXgOaO-5IihiBZ0zA-1; Tue, 03 Nov 2026 08:11:14 -0500
X-MC-Unique: -XTsJcXgOaO-5IihiBZ0zA-1
X-Mimecast-MFC-AGG-ID: -XTsJcXgOaO-5IihiBZ0zA_1793711473
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35c5aef2a74so17266324eec.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 03 Nov 2026 05:11:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793711473; x=1794316273;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0smI/wkIKBhttmjun844YlQk8k5yNcKMLGY89LEOpsg=;
        b=U/CKVf1y0XlY1nJXIABikeVX221LT0Rciq5z3NtWW3WoTC2iMJAqkx2gzuQrnVek2s
         lBpHtuhZmFs28Bfrs2bTrGuZ+ggqG7DtfuoEaPF4TXHv0CixFIhaPcDo5mCu6AALseAG
         +bggisTK1yOPJ8CnI9O2akfzg2Aa6RZkP0lCnQ2FF0gPv9G/1LRvhJioprENRJk1PDgr
         REf72AX9v94KPSNvu9jK7KMgqgEt86VLiMmtveD8V40s0pvtKgoy1rVrJdtX9FSB7F+I
         /2akUhBoD7HGDhPz+r4JU+/7sBKhDSEigecdphAmf0nqUGV4BF2mishKID0JGHHWPQNR
         bMfw==
X-Gm-Message-State: APuU4Z8Uby77raD7Fe9IUkpZy17KnYlN9Wr5Ma3NikaJAYLRjeg/qDtI
	sjN9BhzDPlRGo6ASt3zoKI4k7KFpVFKDVZKJbn81ZXtkphUy/m/8R/U5rr7IOFoT6grMxWY5ng8
	CCmAWIer2pKU1gS7mNhUCBo+y0OvarZR2L41w/PI0cbdyziQanaAuv4/NkyvdKkIFBfiI41T50X
	pshJ7JiA/sG7kgYDLjBm4UbKBGFR8uOmRymzWysnaHuQNB01qdcfLb
X-Gm-Gg: AYBFou0w21Dq6W+q9bqRY4Gl6uzQzxNxSEZ9kJj3mxWhM1iqxC/F/UohpjXVio/4CyJ
	pmaCpCGGze7gohsXKWOh41KN1o0PYEt3vytgpBz8Xm9Jse9M07u1ONwegSM35J+/skDegErSppD
	v5OScBM4lxcU2PzWLl1Ug9zf6Xelzy55eaUOLd5vJeVxBtR0v6akFVMGPO/QYMMso/In6pRQvAP
	4J/T+LN/4WoM43eZtENAHCVvC2xBLP9aDBJPzGDrhryUiDc/pmD6MdUJU6k3HJ+NUBiSfKjIDSB
	Kacl6ZyXUoSUtDJ/9SdFp61Go/eVCPp0CM5ASqx/gzLkHpGDZTtNpY0vEdoQwuMOmzkMqEX2I/2
	Fwls7SBxKu8PQuNov/hAEEy2mrtLYFzIjhVNL9aVpn4ilPajZfwKkH4qXHMt8bU5tjCtd2i3dMi
	qKB/NUsk3cbjrdOEg4Cluye+gN1RBacx0XYOi6l0g=
X-Received: by 2002:a05:701b:454f:20b0:1a6:7a2:cfc3 with SMTP id a92af1059eb24-1ac59fbf8cfmr20574688c88.13.1793711472488;
        Tue, 03 Nov 2026 05:11:12 -0800 (PST)
X-Received: by 2002:a05:701b:454f:20b0:1a6:7a2:cfc3 with SMTP id a92af1059eb24-1ac59fbf8cfmr20574626c88.13.1793711471648;
        Tue, 03 Nov 2026 05:11:11 -0800 (PST)
Received: from mgandhi-thinkpadp16vgen1.punetw6.csb ([2401:4900:88f9:2014:83b2:887f:ed66:aa65])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854d925sm76528079c88.7.2026.11.03.05.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:11:11 -0800 (PST)
Date: Tue, 3 Nov 2026 18:41:06 +0530
From: "Milan P. Gandhi" <mgandhi@redhat.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-scsi@vger.kernel.org, sathya.prakash@broadcom.com,
	kashyap.desai@broadcom.com, sumit.saxena@broadcom.com,
	sreekanth.reddy@broadcom.com, martin.petersen@oracle.com
Subject: Re: [PATCH] scsi: mpi3mr: Fix integer overflow in reply frame size
 calculation
Message-ID: <aundaviO6V5enLO-@mgandhi-thinkpadp16vgen1.punetw6.csb>
References: <20261103123316.223917-1-mgandhi@redhat.com>
 <sashiko-outbox-195282@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <sashiko-outbox-195282@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: j3YeDs67xYWHMqOZjyo96W0rmI8e7UQew9H9KREjD2M_1793711473
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Nov 03, 2026 at 12:49:25PM +0000, sashiko-bot@kernel.org wrote:
> Should mpi3mr_issue_iocfacts() enforce a minimum reply_frame_size of at least
> 16 dwords (64 bytes, covering struct mpi3_iounit_control_reply and all other
> fixed reply structures) instead of only checking for zero?

Thanks for the detailed analysis. You are completely right.
A reply_frame_size below 16 dwords (64 bytes) breaks several downstream
consumers that assume a minimum reply frame size—most notably
mrioc->logdata_entry_sz underflowing or causing division-by-zero,
out-of-bounds writes in bsg_reply_buf, and truncating fixed completion
replies like struct mpi3_iounit_control_reply (64 bytes).

I will prepare and submit a v2 enforcing a minimum bound of 16 dwords
(64 bytes) along with the upper bound overflow check.

