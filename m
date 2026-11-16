Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794871028;
	b=HxDU3GIkHvWNJBEDxEQHwO0yswnvBAZeeD2iyr8ghgmxpqinz9Qq2kf59rUTIWV1c5mi
	 ylmxQVUwDtatXCtpDODnNNEXzjpQLnDpB+9epTDmby/mmRzXsoJ12S/offx0PFxUBa2mG
	 up7azf0SS2j3w/ju5IKQn7+25TKmUJgHQbtPpPiAIPBB1SoABsLiYZCDyfK/CfFPAygGp
	 EgNaO3Q9lF/Al0EIVRq2AQ/zjsrCFSVi4zOF2pGAmkj715j5Ed5AcpH6v5qkjaN6O84bC
	 S1hhpjEd9N9O8V8pv9VV9cyiuLxaNiNhhiBf6FNInQa79q6ub23RMKnrbfrc4d+9ZEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794871028;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=VUtXluh5oLaQga2mDElt3F7B3MTKErkoGZJ+ACHq9d4=;
	b=KJ8QPxBpKX1Cd7JAO63wrKumaisxeXLwVVQzyy6o6LD/5s+jxCkgHyt8CwfCyG2oDFFw
	 yOvMYKc6q5PDJTltgIqYzZnAM32No2zxIBfNrtMVjyZrmkuuCDeyqki4Di108nWSr3TbZ
	 3/G+7kvgGpW8mgYMFbJR6HMRaJ1I8vxAt9/3uv/0jUFO2VoaxnktwOIvFjWbcJnX6ofWA
	 n+2xJes+0UXqlry97FH2YdDwWIih/+/a0PJxR7iGnZOo2ExgGdP3+iGLxizzBkivlnoxi
	 XycQi8wKZpVy5oYrB7A8tUVWj2K4HDkba62/KydwIzHZxtZuo2nRkfYmWFL/oeariqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=B7dUmOt5;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C24606A31C
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 23:17:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67C24606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=B7dUmOt5
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-380b40312e2so2070659eec.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 15:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1794871026; x=1795475826; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VUtXluh5oLaQga2mDElt3F7B3MTKErkoGZJ+ACHq9d4=;
        b=B7dUmOt5tdaUgy0SkPDH71xcDNsQ/fTAbc7BJkwOmQSQLoyihhJnasS5QkYaVrCBgZ
         TXXrN40SKPI+78JdXBGYyOJoilu1Gh6K2H2LACfNCuiDKQfjvzQmWZbUY6kAkfs43Vyw
         fuTHFvCgYEPJ9NBfS6ERsfOtcCjYJEJBz1llgSXs07ztjZuz81HhJy3twKeOGC8XPe3F
         TT5OUsxNeSKKKoV+ZLUp6C0f0ckZWc8crzrhTCnB9s28lmH9OoG0uX8xIymIsDd7Gkj1
         r5OYDhDMbNhvFj/TGt7qxHv+OEW8M4pbceJykMeVUUaCkHf79pIjLBnrVQkrh+D2zIx+
         GFiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794871026; x=1795475826;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VUtXluh5oLaQga2mDElt3F7B3MTKErkoGZJ+ACHq9d4=;
        b=gqtBPauS9+EGI+U1p85Nt7agxr2U7jgm8yqlq56fk4J5QeHUf+Y65g2Lz4qis4q01C
         +Wp/8sh0FJ1mK1cNeSqgJajUAUfTph+gcV8FaEHmW91IAx6EBFsLUM2wz5ch490e3em7
         i+HzAZTugwu1QrolzqbuXMfXhm+Z35FNZPSUgeCnD5HvxvCvcUGU9p1ceRHDacwGwnTM
         Cpq5LRX9sRgDEQEor38qEoM2ixe+s/ysolzqqpyr09rns26EdDSywnTNyQPDhpEDaoxv
         XK3SM4L59jPioSMn/DP9k+5aA8ybVsFiq63ZAGOZ7eFixs1K/Uhwl1lGFA7v9IE0QZ4q
         a+kA==
X-Gm-Message-State: APuU4Z+VVOiTJdjfGkMvaZ4iniJKl/xuZEBTD1CTfOe1QFL40dQWH/yG
	MbcdXIRQb9DcXt/PA4thLyivt0TBtQFNHfuDGbgQW2rJedIjl9U9x50Jpv9nU1TK9nAmiLktV37
	wwB2E1kdUO9ykomF/LUQ6H6R3z6z5z/uabiF9wTCVbc0Fa32ZfFzcVhxhtkflx643IDW1uaj5GO
	XoHjacOU4BmxHaTPocKk2sONyvl+fd20GfQ4/u04bckUVANVuOxAvr96yNthg2
X-Gm-Gg: AYBFou2Cl6tXStXFTpv2lzukVLP5yfXy+eGFbKtVmS1gmlCJQrkx7jMo5g05CimDyLK
	CjwnezbfkU9haHnphlC0qcxFkXAPwmVvWuHlae8c6tLGIpQ5k9VU4Rvw0wcp+p7Gx7Z2Nn+5mNF
	rh2tJS+J3i/s4oQeCZYv0ZcbVSzhwT6L47INSRtixoh4h4q6HzLUtsP9jZQqUYXfLIMW86EARqW
	mOykAgXH2nsHBOlrwalRQI2mOUztW3K6WOxoX0akSNCObqQHzy6WVPFx/+ZiEifmOOxwkrCSoBY
	FV89ajCUdzn37xmxjR4a9zYZJGaqAz+Pir+redKYHeimgH+66+ptJ4I9w9AVkcYUvtFKLOVUNm1
	yAvnFsivsQPqo3weJDfUVt3hZ/r6eWRfi14lvGw0kE1F8J9pk7dIlrpTvZZRJY9MRXDvaq7ReZY
	c7q5Lcd8fwz/Sw+jr/1oRAc6wiIzLN2Qdh1DnlL6nhZM5rXVt4iOv6k6RqlrKC8m14HpWlvU4ad
	q40Btr8ARYzXaa/h0nBnWrbJa43N1pCij5+/KxrytlbYBPToyIsE4tjAVQ7Sfj8b2CqA6uHuAPx
	GGKq2u5ZQdO9Ktr+uBZ06j8aw4X1pCun5v7c/luzSS1mcG24Lw==
X-Received: by 2002:a05:7300:6b28:b0:376:bcc4:774b with SMTP id 5a478bee46e88-3796638ab4emr12333373eec.23.1794871025916;
        Mon, 16 Nov 2026 15:17:05 -0800 (PST)
Received: from medusa.lab.kspace.sh ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-380e0fdcc36sm2832887eec.25.2026.11.16.15.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:17:05 -0800 (PST)
Date: Mon, 16 Nov 2026 15:17:03 -0800
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-nvme@lists.infradead.org
Subject: Re: [PATCH v7 01/17] nvmet: Rapid Path Failure Recovery set
 controller identify fields
Message-ID: <20261116231703.GA1670230-mkhalfella@purestorage.com>
References: <20261114030454.2836543-1-mkhalfella@purestorage.com>
 <20261114030454.2836543-2-mkhalfella@purestorage.com>
 <sashiko-outbox-214092@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-214092@kernel.org>

On Sat 2026-11-14 03:17:21 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] nvmet: missing TP8028 field overrides in
>   nvmet_passthru_override_id_ctrl()
> --
> 
> commit b07e2fdf2211131fb02142faf21d5cf7328792da
> Author: Mohamed Khalfella <mkhalfella@purestorage.com>
> 
> nvmet: Rapid Path Failure Recovery set controller identify fields
> 
> This commit adds the TP8028 Rapid Path Failure Recovery fields (ciu, cirn,
> and ccrl) to struct nvme_id_ctrl, initializes ciu and cirn on controller
> allocation and start, and populates them in the Identify Controller
> response for non-discovery subsystems.
> 
> > diff --git a/drivers/nvme/target/admin-cmd.c b/drivers/nvme/target/admin-cmd.c
> > index f12d830986446..5710ae53eb83a 100644
> > --- a/drivers/nvme/target/admin-cmd.c
> > +++ b/drivers/nvme/target/admin-cmd.c
> > @@ -702,6 +702,11 @@ static void nvmet_execute_identify_ctrl(struct nvmet_req *req)
> >  	id->mdts = nvmet_ctrl_mdts(req);
> >  	id->cntlid = cpu_to_le16(ctrl->cntlid);
> >  	id->ver = cpu_to_le32(ctrl->subsys->ver);
> > +	if (!nvmet_is_disc_subsys(ctrl->subsys)) {
> > +		id->ciu = ctrl->ciu;
> > +		id->cirn = cpu_to_le64(ctrl->cirn);
> > +		id->ccrl = NVMF_CCR_LIMIT;
> > +	}
> 
> [Severity: Medium]
> Should nvmet_passthru_override_id_ctrl() also override id->ciu, id->cirn,
> and id->ccrl?
> 
> On a passthrough subsystem, Identify Controller runs through
> nvmet_passthru_execute_cmd_work() -> nvmet_passthru_override_id_ctrl(),
> which overrides id->cntlid and id->ver but leaves id->ciu, id->cirn, and
> id->ccrl with whatever the backend controller returned.  Every fabric
> controller connected to the passthrough subsystem will report the backend
> device's ciu and cirn instead of ctrl->ciu and ctrl->cirn, and if the
> backend controller advertises a non-zero ccrl, hosts will issue
> Cross-Controller Reset commands that nvmet_parse_passthru_admin_cmd()
> rejects.

Makes sense. Will update nvmet_passthru_override_id_ctrl() to set
id->ciu, id->cirn, id->ccrl, and id->cqt to zero. This way a passthu
controller exprted say over nvmet-tcp does not claim to support CCR/CQT.

I will break the change into fixups to two commits
- nvmet: Rapid Path Failure Recovery set controller identify fields
- nvmet: Add support for CQT to nvme target

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261114030454.2836543-1-mkhalfella@purestorage.com?part=1
