Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793606124;
	b=CgDRjP46/vgiDsiTEs3IHH64nxhxoaz3DAicD1IjbLeCjXmYwO9GhxTarEemzUESVivO
	 6WvuqaERdiIhhSypG6h5sBfh5EecBQiAmjPrp95HtJEQCAdgvQHZe7XSOST4U9DBhyUuP
	 e21w+ElO9co8T7BTKDJBhqXpxKTpBrQQYiCuaWRDqaZRND9xaz+IXrypw+z3VHZ10aDpS
	 XNMlPvP8iFf/9iLt/wb55vKAovCnE5EcRsRjw5P4Tq0bCnIDKpRYtNhn1f8qPqgcAiA6r
	 pFY7xvWkjhArLDqYYhAFc7TRucgNgHidyjl2NAMETvy5HWgVjqsyb27AYK41EpwEWDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793606124;
	h=Received:DKIM-Signature:Mime-Version:Content-Type:Date:Message-Id:
	 Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=dCaiywWa9uG4oJC5Ccve/MxarN4z4rM+HUfQlCwmqfM=;
	b=HlqhQKQ5eX9tr+9NGUxiJv6ABkUq32wJ+GQ/LPWuPYDh4GfJLmzn8/6CQBuCdAIz8nVf
	 asidMcYQPrkno54seeoAFgiyPoLaoVDnyUT53/LnLdWkkv1TVbit8HxYv4puUTM35CDpP
	 PfXFrLGPzaARcDOyFIcchEG0DKlsl8sc2Qk3fCPR+e9eucR5b2Jm6q3M7nSTLK2ZfPGT/
	 5poKq7zoBsDCOuPj+NoMgsWtuqk2JqaRykNj8quuFYNT/w/LGoQBXVz6QMElv/EOKucNJ
	 cD3v+WT0qeuwt5xOxQNpFgpTfsvgTpFNNRhRQ24EBHFgoLp36G6sHCagGM1I7kkeyYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Czzvnvt7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 8F3F5606A338;
	Mon,  2 Nov 2026 07:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Czzvnvt7
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id AB43E1F000C1;
	Mon,  2 Nov 2026 07:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793606124;
	bh=dCaiywWa9uG4oJC5Ccve/MxarN4z4rM+HUfQlCwmqfM=;
	h=Date:Subject:From:To:References:In-Reply-To;
	b=Czzvnvt7fM8JAvdXf+DiKKtIUV7Ar0oblwKD1uMcOsF/Wyr641zoy63xHPTaCh5QZ
	 YHR6fkkUwDANhYNXPGDDhz03ZcHuIa179pXqnJ2f4GHYV+AyTr79YNmLm6qPjexvCM
	 VnwPwL/N1SAtFEK1iHW+1Zdkxn2T2IhqQ/5HXZw3FHrvDXEJewmNzfbCHPF/TTU8JC
	 1S2ZAiSPI4+nPXAObh70gfcKmEWhtM0+XQ6xAzQNagNBaWI1LnfVm9K1JLk6ZVEJQA
	 guFgV+/en6sT84jB4n0AIQ26vRTAd3r4AAtWy/lcqDB0tC7W+7GdD9DeXvzjesgnIX
	 WEe0LMqxC+fKw==
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
 boundary=8f4a6addbf35050c9efdc63c515bfb8f4c83c099cb1cfe7b5bcb4cbbd872;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 02 Nov 2026 08:55:19 +0100
Message-Id: <DMKKB0CXCHFC.365E5XOS5BSE4@kernel.org>
Subject: Re: [PATCH v9 4/8] mtd: spi-nor: sfdp: expose the SFDP as a
 read-only NVMEM device
From: "Michael Walle" <mwalle@kernel.org>
To: <Manikandan.M@microchip.com>, <sashiko-reviews@lists.linux.dev>,
 <pratyush@kernel.org>, <mwalle@kernel.org>, <takahiro.kuwano@infineon.com>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <srini@kernel.org>, <Nicolas.Ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
 <linux@armlinux.org.uk>, <richardcochran@gmail.com>, <linusw@kernel.org>,
 <arnd@arndb.de>, <pengpeng@iscas.ac.cn>, <gregkh@linuxfoundation.org>,
 <mathieu.dubois-briand@bootlin.com>, <linux-mtd@lists.infradead.org>,
 <devicetree@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <cover.1792145382.git.manikandan.m@microchip.com>
 <889d6d5b7c608fd6553f38e4a34b050dcf70317f.1792145382.git.manikandan.m@microchip.com> <sashiko-outbox-175470@kernel.org> <ba131ca0-c659-419e-9ff7-26c7c6de1028@microchip.com>
In-Reply-To: <ba131ca0-c659-419e-9ff7-26c7c6de1028@microchip.com>

--8f4a6addbf35050c9efdc63c515bfb8f4c83c099cb1cfe7b5bcb4cbbd872
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Nov 2, 2026 at 6:03 AM CET, Manikandan.M wrote:
>>> +static int spi_nor_register_sfdp_nvmem(struct spi_nor *nor)
>>> +{
>>> +     struct device *dev =3D nor->dev;
>>> +     struct nvmem_config config =3D { };
>>> +     struct nvmem_device *nvmem;
>>> +     struct device_node *np;
>>> +
>>> +     if (!nor->sfdp)
>>> +             return 0;
>>> +
>>> +     np =3D of_get_compatible_child(dev_of_node(dev), "jedec,sfdp");
>>> +
>>> +     config.dev =3D dev;
>>> +     config.of_node =3D np;
>>=20
>> [Severity: High]
>> If the jedec,sfdp child node is missing from the device tree, np will
>> be NULL and assigned to config.of_node. Does this inadvertently trigger =
the
>> NVMEM core's fallback behavior?
>>=20
>> Looking at nvmem_register() in drivers/nvmem/core.c, there is a fallback
>> mechanism for missing nodes:
>>=20
>>      if (config->of_node)
>>              nvmem->dev.of_node =3D of_node_get(config->of_node);
>>      else
>>              nvmem->dev.of_node =3D of_node_get(config->dev->of_node);
>>=20
>> If config.of_node is NULL, the SFDP NVMEM device will incorrectly inheri=
t
>> the SPI NOR flash's main device node.
>>=20
>> The NVMEM core then searches for an nvmem-layout child node and will
>> find the layout intended for the main flash memory, attaching all NVMEM
>> cells to the small SFDP NVMEM device and marking the layout node populat=
ed.
>>=20
>> Later, when the MTD subsystem registers the primary NVMEM device for the
>> actual flash contents, it will skip the layout node because it is alread=
y
>> marked populated.
>>=20
>> Could any consumer attempting to read an NVMEM cell then be misdirected
>> to the small SFDP NVMEM device's read callback instead of the main flash=
,
>> resulting in -EINVAL bounds check errors or corrupted data?
>
> Yes, this is a valid issue. With no "jedec,sfdp" node, nvmem_register()=
=20
> falls back to the flash's own node, so the SFDP NVMEM device would claim=
=20
> an "nvmem-layout" meant for the whole flash.
>
> Michael,
> this comes from dropping the "if (!np) return 0;" check in v9. I'll=20
> bring it back in v10: without a "jedec,sfdp" node there is nowhere to=20
> describe SFDP cells, so the SFDP NVMEM device would have no consumers,=20

There is no DT user, yes. But there is then a "sfdpN" file in sysfs
which can be used from user space. And that's what my first remark
was about. Why would that only exist if there is a "jedec,sfdp"
child in the device tree.

> while registering it can take over the flash's layout.
> Do you have any other suggestions?

Probably tell nvmem to not attach it to any of_node?

-michael

--8f4a6addbf35050c9efdc63c515bfb8f4c83c099cb1cfe7b5bcb4cbbd872
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCauhB6BIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jT7AF/eKiThz3to8pzhHpX9ZPFYFnbOmy47yTD
czHkeG5xD2uuceGDWu48+9yJaA7CZnLPAYCMhz9TDNZjyZ7ux0o8JmYl0VwafcPN
+t67N/Ksz/89BUzZ+/WjW2AlvsEE9/6UTzE=
=QGVJ
-----END PGP SIGNATURE-----

--8f4a6addbf35050c9efdc63c515bfb8f4c83c099cb1cfe7b5bcb4cbbd872--
