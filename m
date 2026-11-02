Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793587136;
	b=41OEJG4bziROwbZj4BxdETMAurpgDHh618TRGZ/4wbQIfagMRsrER0gfYm26FPiA6oAm
	 KcCp/ieJ0O1m6MqkBAJruSILjqOtSgSJlqVvXx9OqBKAuEqkR4m8DP/DIZtpXcZE1kWHq
	 a+vkM4gEBCDWn883Nze6Ds88Fi8jMTgxt0tskOzs7fhDyXd2aFpm+ZW9l10CgGVgkIr8U
	 +O3V3KIfTETy8R+cMTJCORM+Jdgkq/OnZmgyZBVkpSihpGKKdElvlbFSgvDAHHzzbN4Al
	 aV0ikQoN3pNCHrg2fxZ9OCNE/Ikmz6yXUCnGITRSw7SN2Zt2e3Tpmj1rq9eF+jLYIqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793587136;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=Jci9qiUbYMeQLnsVE23Fk/bmS6/YaF98wtPe2dPL9Rg=;
	b=DaMoM6auChaeMtbSq1yzZYPxgQyPNC6TeUzqYrtf+DvDldGp8yLqPEwkJY+DE2jKzn5f
	 uXT7UzsXPfqiaXF6+0MkLpyz3nyicrlXTuAosa3QC/XlB1bzhnb3lyKiK3+PVFHQqfDn+
	 Nmo379za73qyPT8UVb2ScNlf9rWt8BGonSrfQD5u0RuOQ7UWkZIhTKL0tHRQyQ9GkSHLC
	 dqPYUdjeAaj9GTdR/hl+3t1rkjadauK9Rntf5vvlki9bdADmqD7uszmc7/B1wgleXCapD
	 e02eBH8nShOhJsAWqh5s/IO+JXv1k9Kjgj6nmxn9+TdBIrUhHtO5Za3+qPZTwyjQqUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA47606A327
	for <sashiko-reviews@lists.linux.dev>; Mon,  2 Nov 2026 02:38:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDA47606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ac451e128cso1483465a91.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 01 Nov 2026 18:38:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793587135; x=1794191935;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jci9qiUbYMeQLnsVE23Fk/bmS6/YaF98wtPe2dPL9Rg=;
        b=MWQE6atSXHnZcjidXxzCt4MZVwrmG6w8PVEjkRrFBTV5grbImusSrDav/GKuXYVWFB
         oiYC419iFPrzOpoJmBGVIOqKkTLjunr1hV2DG7vvf0Xqtu9srOUB87LL2G82nIphgYnP
         wV4Ga6lQtSwX+6XbHkc5EMMapvOSBTGTrfgT6VY095N/0EITTb7xfQz3d8ZQJuwx1/hJ
         BjUsRiCjl7Jx9TOSKjQ4axUb+cC0z2kZPdWHPVAf8b0XhixAsyBEK3vFyi3oYDFqLPta
         KaB7D37Jm0r7gUpBxpItgSR1ZxyvDhxn/uToKARMA4iuZs4vQLsD3IMZjPrizqFk15dd
         +D2w==
X-Gm-Message-State: APuU4Z8yAjhsJ8QKQ33i/osqkoI9FoKcnpETYcMRBg02/64hNW5T/dZE
	mnFZm4lPpr/jwAeSwaWydQ8cU6IIZ6tJdP2Ib4ffCgHgzhCHC/cjKqTmY26axgc5
X-Gm-Gg: AYBFou0dY2Nf7Vk9twOSU/zdjUyjDI2Rc2F2ESg655zOCMmUa/g5NVxIIPXlOxCjQPM
	5yRdZAg1tX/ERCwktcHPtcR4lZrQEpRwtjR02d8pwxQ/X47peV0iYQEpU3kw3x0jpf20VZqqelt
	2EvnpgZ/DZlz3H7hPNWZC2KG6C+4B1qIyjyDAHIqcmkA4HMqcv7/7LQdSbzuHC/xOY9w0M01zGV
	JUL2Ywp19RH761/7D5N1nmU3ggAX+KpodGckRWWRRnYwPcrvmMe5AY+HL2cjDJXUVWh+ysyb/ZJ
	Fw0xk86n95PihVSk8XGtzJo3oEiJ6OCNRttSRJLvkz1qM5cJ8m/kcvlY/sidYU2/p+U8dQW2fXK
	E7zuMFTtx75kDaW84IbIWTh/69BQt6H9OIhJu9RkNePgVnYmrovx9qWDsnd3+tva1jBNEcH3snp
	NJimIMb2DhfiWUxjSVugZDJuWH2ueJS+BepbfeIYwjTbzKpo865D1hJWLqsyh+VgVz+R3djYnct
	LXeW5enQEtNJyNdr7SrJZ2K/gypqxIK9OhfkZVrCkQlNhbucHkrtgTtxLkB+dXCt+z+u7rJdOn0
	G95N0WE8Nd0v2JjeyH9e9G7CwgYRpBs8ebJqxLVJCkaOLVs5qGQs6AZurGlTBs8wOcPO9cQUaHS
	H9NHVIDorYXk7hf4rQ+RIZdZX6jTfsb1jmwK2W7BoLVHIvwmWmSYWLTChWP4qWIEh
X-Received: by 2002:a17:90b:5807:b0:3ab:be66:ddbf with SMTP id 98e67ed59e1d1-3ae8981dd4dmr6918014a91.54.1793587135123;
        Sun, 01 Nov 2026 18:38:55 -0800 (PST)
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com. [74.125.82.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845df666sm11863641a91.14.2026.11.01.18.38.54
        for <sashiko-reviews@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 18:38:54 -0800 (PST)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-353804b591eso4512982eec.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 01 Nov 2026 18:38:54 -0800 (PST)
X-Received: by 2002:a05:7301:db8a:b0:36a:279:c93f with SMTP id
 5a478bee46e88-36a423fda77mr13492128eec.33.1793587134291; Sun, 01 Nov 2026
 18:38:54 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261101-ktd202x-et6326-v1-0-eb51eddad08c@telaak.dev>
 <20261101-ktd202x-et6326-v1-9-eb51eddad08c@telaak.dev> <sashiko-outbox-192833@kernel.org>
In-Reply-To: <sashiko-outbox-192833@kernel.org>
From: Joseph Telaak <joseph@telaak.dev>
Date: Sun, 1 Nov 2026 21:38:42 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ6GHfhAp9Ck6WakVy0yh5YjG-TApW4zaOp6vAFDGivTaA@mail.gmail.com>
X-Gm-Features: AclHuK8Yeg2RaovImaieDc_RzvYkCKj9n4PkC3wjqPhvqeEv6To4mOIylRyTbUQ
Message-ID: <CAPY4CJ6GHfhAp9Ck6WakVy0yh5YjG-TApW4zaOp6vAFDGivTaA@mail.gmail.com>
Subject: Re: [PATCH 09/10] leds: rgb: ktd202x: Fail the probe when the chip
 does not answer
To: sashiko-reviews@lists.linux.dev
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, lee@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 1, 2026 at 9:22=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> - regmap_write(chip->regmap, KTD202X_REG_RESET_CONTROL, KTD202X_RSTR_RESE=
T);
> + /* Nothing is read back, so a failed reset is the only sign of a missin=
g chip */
> + ret =3D regmap_write(chip->regmap, KTD202X_REG_RESET_CONTROL, KTD202X_R=
STR_RESET);
> + if (ret)
> + return dev_err_probe(dev, ret, "Failed to reset the chip\n");

Please don't apply this one as is. As Sashiko pointed out, the KTD2026/7
does not ACK the reset command: its data sheet says the byte that resets
the chip is followed by a "not acknowledge", which is to be ignored. The
ET6326 I tested on does ACK it, so I missed that this breaks the probe on
every KTD202x.

v2 will ignore the reset write again, and fail the probe only when the
write that puts the chip to sleep after the reset delay fails.

Joseph
