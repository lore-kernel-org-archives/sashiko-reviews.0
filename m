Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699964;
	b=q94moxt0kORD73Ua1azdtwE/nJFuNPZ/uUeFQtrsQU/UxC7konul37qPXUiDtCsjLTCF
	 h02beLj6EpmGurcZKFAQfaCfqDnnXL83jllk4Z+0d4iNI9bF21znB8YbcSnI2l954Qg6/
	 QvXiSGD9QI7q/CG3qaY3pUUUxy2/C7e8vrySSwHcS/sK74Of6v/sqYBhuSoAjyyoKcTxu
	 gRsstMXWNn7BCvA9/+FFKxdnFAjZrOFt5CvVug+et/z6j2w3ql18g905KbT4f7yFoJKWB
	 yUGl5HfkCRkL7TnshgpsCEKuZ3jGNKRusbk2cP6FfH/BQHqay1TmFxQX3MswcEXGEQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699964;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Mime-Version:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:X-Mailer:References:
	 In-Reply-To:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=E6XwjYVFxOq1EU2kDNCxHObwFWcSjdkklkUMNeZdLLk=;
	b=r//44iYMyPtGkAa+vfzVgcHIUxGoVC/rINVMfcPhB1dkI77DHU3tBVpAuUmhyk+sZZ6f
	 sQ8ecmy4Vq5Mq4LODC9qeXVp2zCsL9S4UNrEMZBVGGTH7nITvE8JJfvYx7cwVpPU3YVni
	 Gnb0lty1lZKymtnoLjsDB9hP1XzGCDuDDPpntPKZ5uUb/9bVwYabnonVKRrLAfdpwSFJa
	 ms9jQqiKL/6YSk5IfTlwScDBHMJsxoTPz6Cpi6Uf+7/MCVkHjM25xKFkkd9fdLdYgDOUF
	 lytrjwx5peGDyO4tI2/CVYK+hZHvmdBFqKiA/LaguvdFLtSoLpgntb/sLturC6acEyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=pEVyOuDn;
	arc=none smtp.remote-ip=54.204.34.130
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7708606A334
	for <sashiko-reviews@lists.linux.dev>; Tue,  3 Nov 2026 09:59:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7708606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=pEVyOuDn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793699951;
	bh=E6XwjYVFxOq1EU2kDNCxHObwFWcSjdkklkUMNeZdLLk=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=pEVyOuDnIc0yhzE4phmGy+kWxLCKbbIZbDRZWD4hu/xpZV8L/+1OW+cImvmrdCeTO
	 STT1hwOQeec3+M0chhA4eRLX96hDlJyKrFVBjgOSiNOsQvBhF7uoLSELTdAFa2/q1v
	 s5hQvlZohch9nzSte0oVC4iykbUdQJ9ynqmHzxm0=
X-QQ-mid: zesmtpgz6t1793699946ta527b0e6
X-QQ-Originating-IP: 4vHj0Vh5CPnG4X18DwSMO7anwG+cmwm2qpkUdqYTBVg=
Received: from = ( [58.254.69.131])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 03 Nov 2026 17:59:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7809252169099077377
EX-QQ-RecipientCnt: 5
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=39241e7ded09502daa50d95460e17a62bb39f0ba01c327f033f2e2726eda;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 03 Nov 2026 09:59:03 +0000
Message-Id: <DMLHKAKIEKM7.Q91MZ9YDVNIW@linux.spacemit.com>
Cc: <devicetree@vger.kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>
Subject: Re: [PATCH 2/5] clocksource/drivers/spacemit: Add K1 timer support
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: <sashiko-reviews@lists.linux.dev>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261103-spacemit-soc-timer-v1-0-36722421db6e@linux.spacemit.com> <20261103-spacemit-soc-timer-v1-2-36722421db6e@linux.spacemit.com> <sashiko-outbox-194914@kernel.org>
In-Reply-To: <sashiko-outbox-194914@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MTEDbjSlHDMWN0getaFD1Qnm+t9utiDe0bDDXCcqXCR0e+4QZkf1Ehdn
	L+2s7fNqFHL+bcOIlFAMLaqw7L5fmygLCtErWKss/JHNHonGB3b6VPGk/JkE6qn4Y0rQAHF
	5t9LSu06HgNyYHajguf6iAhFV1f9WlmKJee7egTocpCBzqpTe9LlpfgiDXkYNGQdjSg/Ewq
	RPd4mgr6X5GnmGMF4Kv09+xGXjsm8LutwEKmcwrxyJBtJdClHMsvSFYKHTdNpwb5W3ki9LH
	gqrugZCkADVO4KYnwFijiwbdF8nnGB8+Su2Y+v51MDsjZAzcmsJYaOewbqwkLb9LN8GV+EN
	44xjQs8CodtHDPTojY72gwH7x8OPnuwfvfedQD23+IyalomACQeyZeLYbJ8Qp9D2+tX1k3C
	UGW5dYyKZaofs2XDWeCH5bEh1sm5uVT0a4WHRUt5/6qvSJ1Yilmt66oMnCiK2pvW32Mt7tE
	SnerfUOfAzbOQmujSsmCC4HG+J1XbozFBlbwqVmWr/ZBcuP2YY6pArCPDC0mSAVGmpytLCg
	Ve2QseSCXbMCEfVp5s7Gv9r5zr8aKA6LgIvsr6y+RLiJDikF7nC4NmEZhwohaOXFMzZm3oc
	qFYgluLf8oNVFu3U1STX1DYLPSa0ZlaLyatX2XHQz6mTeR1X/Qytog3wvei4W22Yt7+6a0o
	tZ32TuutMrVBxc4jnZpxI/q4HpasEUUqYF9dBati2qKNbQi2IsvTD8khGoJijMmyNeIOv2W
	P6J7EpuxPea7UVqmEE8fHz929fiaeiQWejrQU9gBu3DDrwBMB/teS1zFN0td61uvUxr7/x2
	D9Uv7JO4tP62KPFZosLzcgvRn+pmspUaEHOiaWFVrvSOz3oY9YS8HAUVehaztDOaUHdWLT9
	OgI4Tk/V9rtiu3q6hg9ZB7/xXVoGLXFI3umHMA0IikAYyok7n/MIPsOyOlXQJXVrO3OOtHI
	AVOD1kfsSM7JLnUZnspLp2M4yIh5lKtqeOb7aMP1IS4cGKPuT1J+Gso40PZHhkp91mv2zfD
	qHvPnQw7rc8vEBsIj+JiwVwjfokzgT4wQ43DJjsHiWmqCE/IJSkUpaWFpoKqAzRin5LuPI3
	pZ1RWA+wNxpVzSun5EDmhA=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

--39241e7ded09502daa50d95460e17a62bb39f0ba01c327f033f2e2726eda
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue, 03 Nov 2026 09:02:07 +0000, sashiko-bot@kernel.org wrote:
> The K1/K3 timer block uses the MMP timer register map (as in
> arch/arm/mach-mmp/regs-timers.h)
It doesn't. The offsets in the driver are the ones from the K1/K3
register manual.

> Should spacemit_timer_stop() latch and read the synchronized counter
> snapshot through TMR_CVWR(0) (offset 0xa4) instead of reading the
> counter register directly?
There is no CVWR on this block. The count registers are already
synchronized to the APB clock domain and can be read directly.

> won't setting TMR_FREE_RUNNING in TMR_CMR leave the counter at its
> previous non-zero value when re-enabled
No. Enabling a counter in CER always restarts it from the preload
value, which the driver sets to zero.

--=20
Troy Mitchell


--39241e7ded09502daa50d95460e17a62bb39f0ba01c327f033f2e2726eda
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCaumwZyEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC/pQAD7B7bhsvgFfoYH
vE1bIZjZnzGRdd3oPdBpoI3Gc2cIPDcBAJwn/ZhmIl1spND8pQsq4DRYOmSn9Xcl
CQc2SfHpqJAG
=2AsY
-----END PGP SIGNATURE-----

--39241e7ded09502daa50d95460e17a62bb39f0ba01c327f033f2e2726eda--
