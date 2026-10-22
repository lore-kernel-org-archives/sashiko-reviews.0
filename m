Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792662731;
	b=mVVZC221Kvh9Q5dI22KX3pAuhHQgboSCoyuwIVlBfDMqJZ6kwwJZk6Hq6kgtn3nvgOCW
	 jnIpfyzq1TR9iuoZKQPUumNoL+I+ef1Zl1fq9mXhe64GBMiFowJpWSElAsyIoc9nJgz+G
	 yF1Ivv+8RAwKzkCwj+XzVTZVOPEL2nSKRNYW21lo1ekTnPLylqQe8iT+F5VFr7K62qV+P
	 sb1CeZZ5BX67Xf6pSKGhku+rDaXDwkeQsRJg8Vm5SUQ8RIzkh4YcWbX5MjtblGpOEWL1J
	 sV486YBHzLbukh1YhMz6RjDAvg2cJa6ahrCbadjcK/9iJmK1wC/Zq1/ERwpEZw1i/yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792662731;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=F/chYiasiSXcn83g5A2gWdD74tn+mRgtMiCgnkCqNTg=;
	b=oaGuOsiIUqe+rFGTET1HnaiNBKOhFKnxmdMhcYkEBJ/qchvSGa7MTBL7J5dvLxF/3UlH
	 +0NNBobBAiTSjD4/BFJO6iVWuRXq1FJsK4jsh4tU9xUaIWQIPp1OqQvRbbnMnyWBqZXRd
	 TefVY3GKwAEYWAIkjc3tWnStyISKai+CvEoxy411fWLqmtkyVtdwbPEoJ+PV8bLtOxeWy
	 RQjlrLfhGnZQ3+cY8H6s8QwowOVyzZlHoU7vp9KA7Qq5WyP7mtYws+QjcBTdFGJfRmtPh
	 43yPmmvTDivYRIuBZgxI87VVTjK1Avggmj7sVkdd3yQFlAvCvbN7yFTIBWYopRhupyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Vjf2fb0z;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3CA606A31A
	for <sashiko-reviews@lists.linux.dev>; Thu, 22 Oct 2026 09:52:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB3CA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Vjf2fb0z
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 16E0FC58470;
	Thu, 22 Oct 2026 09:53:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BD0E460360;
	Thu, 22 Oct 2026 09:52:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7CD6210328E44;
	Thu, 22 Oct 2026 11:52:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792662726; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=F/chYiasiSXcn83g5A2gWdD74tn+mRgtMiCgnkCqNTg=;
	b=Vjf2fb0zvrDj5uRNZZFDtFblI9dLdnBb40EzR5mWLG/MCNPR6BmUTqmn4GrMPr07GjeTA7
	V1fB31mFXvXtTiQI9LWq9KpDu0YU9FUSxZO2Giu/ccm0obQRsR2vJVr5uu7PEF1NE6Kx1m
	cPGdSwVjhQTgKoIRUR9kTbdx+qteyFmz21VI/VmUK+/ct5/MpetPF877piSWq0YAU2fPaO
	eX9qo4dMqOg1wmpvqFozKp+1kcqAewdW6A/ika83i/Qg+W2EgptAa2KfCuR1FyDTf525+x
	ZW+X7aGUmgt33mNaOW8T1QA7MP2dWwQyx2thwQMv2aABzYtcOCrHgVtaYfY52w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Bough Chen (OSS)" <haibo.chen@oss.nxp.com>
Cc: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
  Pratyush Yadav <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,
  Takahiro Kuwano <takahiro.kuwano@infineon.com>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
  "imx@lists.linux.dev" <imx@lists.linux.dev>,  "michael@walle.cc"
 <michael@walle.cc>,  Bough Chen <haibo.chen@nxp.com>,
  "Frank.Li@kernel.org" <Frank.Li@kernel.org>
Subject: Re: [PATCH v3] mtd: spi-nor: clear the default read_sr2 opcode for
 xSPI Profile 1.0 flashes
In-Reply-To: <AS8PR04MB8820F1AAF591DCF5C9D0136090652@AS8PR04MB8820.eurprd04.prod.outlook.com>
	(Bough Chen's message of "Thu, 22 Oct 2026 08:56:03 +0000")
References: <20261022-spi-nor-fix-v3-1-bffa00b75c27@nxp.com>
	<sashiko-outbox-181158@kernel.org>
	<AS8PR04MB8820F1AAF591DCF5C9D0136090652@AS8PR04MB8820.eurprd04.prod.outlook.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 22 Oct 2026 11:52:01 +0200
Message-ID: <87y0bqqczi.fsf@bootlin.com>
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
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello,

On 22/10/2026 at 08:56:03 GMT, "Bough Chen (OSS)" <haibo.chen@oss.nxp.com> =
wrote:

>> -----Original Message-----
>> From: sashiko-bot@kernel.org <sashiko-bot@kernel.org>
>> Sent: Thursday, October 22, 2026 4:21 PM
>> To: Bough Chen (OSS) <haibo.chen@oss.nxp.com>; Pratyush Yadav
>> <pratyush@kernel.org>; Michael Walle <mwalle@kernel.org>; Takahiro
>> Kuwano <takahiro.kuwano@infineon.com>; Miquel Raynal
>> <miquel.raynal@bootlin.com>; Richard Weinberger <richard@nod.at>;
>> Vignesh Raghavendra <vigneshr@ti.com>
>> Cc: linux-mtd@lists.infradead.org; imx@lists.linux.dev; michael@walle.cc;
>> Bough Chen <haibo.chen@nxp.com>; Frank.Li@kernel.org
>> Subject: Re: [PATCH v3] mtd: spi-nor: clear the default read_sr2 opcode =
for
>> xSPI Profile 1.0 flashes
>>=20
>> Thank you for your contribution! Sashiko AI review found 1 potential iss=
ue(s)
>> to consider:
>> - [Medium] mtd: spi-nor: read_sr2 left set for 8D-8D-8D flashes without
>> Profile 1.0
>> --
>>=20
>> commit ef4079e3aea2014890e08df31ea4d8775a392f81
>> Author: Haibo Chen <haibo.chen@nxp.com>
>>=20
>> mtd: spi-nor: clear the default read_sr2 opcode for xSPI Profile 1.0 fla=
shes
>>=20
>> This commit clears params->opcodes.read_sr2 in spi_nor_parse_profile1() =
so
>> that flashes with an xspi profile 1.0 table do not issue an unsupported
>> 0x35 register read when running in octal dtr mode.
>>=20
>> > diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
>> > index 4a3f82e97cef8..722eeff71d0df 100644
>> > --- a/drivers/mtd/spi-nor/sfdp.c
>> > +++ b/drivers/mtd/spi-nor/sfdp.c
>> > @@ -1344,6 +1344,17 @@ static int spi_nor_parse_profile1(struct spi_nor
>> *nor,
>> >  	 */
>> >  	nor->params->hwcaps.mask |=3D SNOR_HWCAPS_PP_8_8_8_DTR;
>> >
>> > +	/*
>> > +	 * The xSPI Profile 1.0 table does not describe a Read Configuration
>> > +	 * Register (RDCR, 35h) instruction, and the single-byte RDCR default
>> > +	 * is not usable in 8D-8D-8D mode. Drop the SR2 read opcode for
>> these
>> > +	 * octal-capable flashes so spi_nor_read_sr1_and_sr2() degrades to
>> an
>> > +	 * SR1-only read and spi_nor_init() does not issue an unsupported
>> > +	 * command that the flash never answers. A manufacturer driver that
>> > +	 * actually needs SR2 can install its own opcode in a later fixup.
>> > +	 */
>> > +	nor->params->opcodes.read_sr2 =3D 0;
>>=20
>> [Severity: Medium]
>> What happens on octal dtr flashes that do not publish an xspi profile 1.0
>> table, so spi_nor_parse_profile1() is never called?
>>=20
>> Specifically, some batches of the Micron mt35xu512aba lack the profile 1=
.0
>> table and instead configure SNOR_PROTO_8_8_8_DTR in
>> drivers/mtd/spi-nor/micron-st.c:mt35xu512aba_post_sfdp_fixup():
>>=20
>> 	nor->params->hwcaps.mask |=3D SNOR_HWCAPS_READ_8_8_8_DTR;
>> 	spi_nor_set_read_settings(&nor->params-
>> >reads[SNOR_CMD_READ_8_8_8_DTR],
>> 				  0, 20, SPINOR_OP_MT_DTR_RD,
>> 				  SNOR_PROTO_8_8_8_DTR);
>> 	...
>> 	nor->params->hwcaps.mask |=3D SNOR_HWCAPS_PP_8_8_8_DTR;
>> 	spi_nor_set_pp_settings(&nor->params-
>> >page_programs[SNOR_CMD_PP_8_8_8_DTR],
>> 				SPINOR_OP_PP_4B,
>> SNOR_PROTO_8_8_8_DTR);
>>=20
>> In drivers/mtd/spi-nor/sfdp.c:spi_nor_parse_bfpt(), params-
>> >opcodes.read_sr2 is initialized to SPINOR_OP_RDCR (0x35) and remains set
>> when the quad enable requirements field contains a reserved value (which
>> mt35xu512aba_post_sfdp_fixup() notes is the case on this part) or
>> BFPT_DWORD15_QER_NONE:
>>=20
>> 	params->opcodes.read_sr1 =3D SPINOR_OP_RDSR;
>> 	params->opcodes.read_sr2 =3D SPINOR_OP_RDCR;
>> 	...
>> 	default:
>> 		dev_dbg(nor->dev, "BFPT QER reserved value used\n");
>> 		break;
>>=20
>> Similarly, non-sfdp flashes initialized with SPI_NOR_OCTAL_DTR_READ in
>> drivers/mtd/spi-nor/core.c:spi_nor_no_sfdp_init_params() enable
>> SNOR_HWCAPS_READ_8_8_8_DTR while leaving params->opcodes.read_sr2
>> set to SPINOR_OP_RDCR from spi_nor_init_default_params().
>>=20
>> When spi_nor_init() switches these flashes to SNOR_PROTO_8_8_8_DTR via
>> spi_nor_set_octal_dtr() and then runs:
>>=20
>>   spi_nor_init()
>>     -> spi_nor_cache_sr_lock_bits()
>>       -> spi_nor_read_sr1_and_sr2_careful()
>>         -> spi_nor_read_sr2_careful()
>>           -> spi_nor_read_sr_ll()
>>=20
>> wouldn't this still issue the unsupported 0x3535 register read in
>> SNOR_PROTO_8_8_8_DTR mode and fail probe or resume with a controller
>> timeout?
>
> Hi Miquel,
>
> The Sashiko AI review raised a valid point on v3.

Is it a valid point? Only Winbond flashes have something in SR2. It is
mentioning non SFDP compliant Micron devices. So this case never
actually happens.

> I see three ways to go, which do you prefer?
>
> 1, Keep the v3 approach (clear in spi_nor_parse_profile1()) and fix the r=
emaining
>     cases one by one, clearing read_sr2 in each relevant fixup=20
>     (e.g. mt35xu512aba_post_sfdp_fixup) / no-SFDP path.

This is my favorite option, as you can guess.

> 2, Move the clear into spi_nor_late_init_params(), gated on the 8D read c=
apability
>     (hwcaps & SNOR_HWCAPS_READ_8_8_8_DTR) and read_sr2 =3D=3D RDCR, so al=
l 8D=20
>     paths are covered in one place.=20
>     The downside: late_init runs after the manufacturer fixups, so if a v=
endor later
>     wants to set its own SR2 opcode for 8D it would be clobbered here and=
 overriding
>      it cleanly becomes awkward.
>
> 3, Go back to the v2 approach (clear in spi_nor_set_octal_dtr() when the =
switch to 8D
>     actually succeeds). This covers every path that ends up in 8D regardl=
ess of how the=20
>     capability was discovered, but it is runtime-protocol based rather th=
an capability=20
>     based, which you didn't prefer earlier. And this method has the same =
downside as
>     method 2.

Thanks,
Miqu=C3=A8l
