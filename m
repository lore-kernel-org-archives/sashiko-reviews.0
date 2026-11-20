Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202707;
	b=WJpxumX6lnxxiHV9iku5KEZm7bRY3HVVfrRjKdpWEl+YXIkS0Dgzhc3ouIIa9p0M+NWE
	 4AkpzkRQ+rNC6azfniKCfddDpPiH4YebeATO+nd9nX12FHdNzdTdML7KN7f3w0bjcKBoT
	 YQx9eTcrTwiO+mtgTxZiCQKMWWTJMTe+OenHMkwy+2Gu5R4U76KCLZ5ByNhors1jeTex+
	 ervoCoyUmgLtQYuII+44TZNydy6NK/r6LdJ9Elj4CQPBPwdtX5UuUGIkuiaxlg1L/Yqa7
	 tyqrgFgHyFgkM0YrCIuKNnc7anmjNu7JB8JdCw1eqjCLjCWoenFdBe8rx3eLjD28Rlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202707;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:From:
	 To:Cc:X-Mailer:References:In-Reply-To;
	bh=/RuK77T8Pc2yA26RkCicA7q1V6UBHbE6inBIYLOkP8Y=;
	b=uAOwxnSmbBsmP83gseZKvE4hQTFhHzskrXXR3w5OeRGTqy4LjqTuXHeKtwD00gouzLzP
	 Wbl3IuLvph2Ah4PTQ9u+np0AIaSmld4wc/XdktnWx/qy9i3iV2wg8uXczOiK3zE5xumkm
	 IIMDOBNm6nGojIo/wFlRLX5bpl8DMnH6Y8cNxaWBaR6RbamBX6/g4Is/Z6rasrqdfb2Il
	 yT6Zyye2HR7mCBnTZUYL5Jd1d2oSViod/dCG1P17EvZM5FhA3d+zEXXcLuc8LYf1d52FS
	 eMU0hCA0dY+Pnx7L14CZCGGLcBya/zyjEPfmy1HKQ0aoCADqn+fhE5bN47MSL3Y8Kag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FxhoyqOX;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF64606A333
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 19:25:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EF64606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FxhoyqOX
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8b600fae14dso467034b3a.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 11:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795202704; x=1795807504; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/RuK77T8Pc2yA26RkCicA7q1V6UBHbE6inBIYLOkP8Y=;
        b=FxhoyqOXC7nud/boNi737kbg07Z7AMxnDQ4D82rKh+kb6KaRWjt3aEicIXhN2gLopv
         L2K7zXg4D37qYW6Fb/hf/4c3iW4ibO1MdQY0v0DXFBeycGxr+9PtQFDst8t6/+KZ2U0I
         KhBWscNN8kXRSTvVXWNa50FrO9LbxcgVXIZWn+bHR0ytbyWJMsEs4sK7JVgAN2FnMZpV
         I5cpnFF+fdO3S3cYVBKaOOdvJQJ2JyfobqQG13Zi3IJpeMTavCkuOJMmus5wduelWmf4
         e2SC7oSH98x3BNbUbEyhGiZhUgrltJQo+ytefqFN2gk3INZSPHlmoiXepmY7d6eClGDP
         GEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202704; x=1795807504;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/RuK77T8Pc2yA26RkCicA7q1V6UBHbE6inBIYLOkP8Y=;
        b=GMgumCht4XAvAgq1Z6A93aLAtdFuL4BrFJzgfHo9QgWo0fRSXCKHtvd66SCqIoECgz
         JArf1QPPqy0F8Oo9MvYNvQYNXAvz6yO34LtoNMIi+ppabEW6osm784twM3TCbvBZBTQb
         Ulv2iwNoQP1r65L5ebqY9gW/4lCoEwYIgAg9MFaQ1NwVeHnwbQdmwNhSCm14T+wUXP4I
         8hDhrANEquh5GCScRViQ9+q0EIAdM7+ysmJvMRyWVjI2B0kj2arqAYlIyAtH7SQ96GIc
         zoxEZ5hTS66Ld4OEuGyQGd6NAGHc+2ASNn3CQeB4aONaHpnTYcmk1cWM4yU6yeCX7zI/
         GKdw==
X-Gm-Message-State: APuU4Z/XduPLs0Y7ThNj6uYuYtucUOBdDcz0EBc5kuYmlW9zdJAAW9il
	Ih0KeEWJLlVefWLX5mJiKYMS3OKpAtSvLKgtIpBQlAV83Rs+r+DiAyo0NtvJSgGGUleCcCVxDTQ
	jYH+mluwc
X-Gm-Gg: AZFdTZcaGaa7BP6HnJlh98ByGyP1BCKEL07UnbnHD5H7i7YNllFPpUs0FUUdVDGRXq3
	SToGWe5brCk/iFgoa6P0ghNRgnHT90xJgADm56FU2+nAqX9g1hicjtgeWpAt9umxQwuRgaMjgSC
	JnxMulWnhHHdgfQd6JuUSI/a45yT1sdlDgADxO318I29t5gn9NqdxBUJkeY9/L/SypGd+zd95UW
	dCd06YgT/I7kGLnwoZjJgZNi/d/1qwz7CpVIibLgq0w7QxLNwsIEcQfG4JUVmah4lDJTh7JAKA5
	WYblwA5OdEksISflIqP7nNkKgBvGJQnpVCBZfbiuU06oc/cDHOVrnb4l2OL/ce94NFdeC0auMIU
	jjhie2wUjVaA5aeoLTNO0k/6BRE3ciOrySO+67S/wygeg0MNLb/4R79tV24fTh66QAgVSBLnRYM
	KbEgt3j8ivy+sLlL0EEJ50uWlejDbz9RLxJ6YD6ngRM6BTMkJ76aClnsvmAvQD1KRSL66NIjvvT
	YLrkf7cWMCIK8Ep2J1RVYqzUkW9Qv0HO8gdfjBR3b6NeKZQ/LLsQquOdtfttOUPWJrQNh4648Yb
	2M5o6MDmepP6wSA3ZQeDpYyeotrqzoquosZ/ujjd3DWAN4c2Q73yaUvdmYYh1peCTQ==
X-Received: by 2002:a05:6a00:f8e:b0:89f:d620:232 with SMTP id d2e1a72fcca58-8c87c864543mr3577508b3a.35.1795202703993;
        Fri, 20 Nov 2026 11:25:03 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87343f83dsm1923249b3a.39.2026.11.20.11.25.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 11:25:02 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Nov 2026 11:25:01 -0800
Message-Id: <DN0A8VWPLTYF.3Q0MIEDWLJYN4@google.com>
Subject: Re: [PATCH v11 10/13] PCI: liveupdate: Adopt ARI Forwarding Enable
 on preserved bridges
From: "David Matlack" <dmatlack@google.com>
To: <sashiko-reviews@lists.linux.dev>, "David Matlack"
 <dmatlack@google.com>, <kexec@lists.infradead.org>, <linux-mm@kvack.org>,
 <linux-pci@vger.kernel.org>
Cc: "Adithya Jayachandran" <ajayachandra@nvidia.com>, "Alexander Graf"
 <graf@amazon.com>, "Alex Williamson" <alex@shazbot.org>, "Alex Williamson"
 <alex.williamson@nvidia.com>, "Bjorn Helgaas" <bhelgaas@google.com>, "Chris
 Down" <chris@chrisdown.name>, "Chris Li" <chrisl@kernel.org>, "David
 Rientjes" <rientjes@google.com>, "Jacob Pan"
 <jacob.pan@linux.microsoft.com>, "Jason Gunthorpe" <jgg@nvidia.com>,
 "Jonathan Corbet" <corbet@lwn.net>, "Josh Hilke" <jrhilke@google.com>,
 "Leon Romanovsky" <leonro@nvidia.com>, "Lukas Wunner" <lukas@wunner.de>,
 "Mike Rapoport" <rppt@kernel.org>, "Parav Pandit" <parav@nvidia.com>,
 "Pasha Tatashin" <pasha.tatashin@soleen.com>, "Pranjal Shrivastava"
 <praan@google.com>, "Pratyush Yadav" <pratyush@kernel.org>, "Randy Dunlap"
 <rdunlap@infradead.org>, "Saeed Mahameed" <saeedm@nvidia.com>, "Samiullah
 Khawaja" <skhawaja@google.com>, "Shuah Khan" <skhan@linuxfoundation.org>,
 "Vipin Sharma" <vipinsh@google.com>, "William Tu" <witu@nvidia.com>, "Yi
 Liu" <yi.l.liu@intel.com>
X-Mailer: aerc 0.21.0
References: <20261118223704.3286085-1-dmatlack@google.com>
 <20261118223704.3286085-11-dmatlack@google.com>
 <sashiko-outbox-224145@kernel.org>
In-Reply-To: <sashiko-outbox-224145@kernel.org>

On Thu Nov 19, 2026 at 2:38 PM PST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] PCI: liveupdate: stale ARI state in pci_configure_ari() with
>   pci=3Dnoari
> --
>
> commit ee2b5e1cebde3231a1c9acaaf68c272dbf3c6e8e
> Author: David Matlack <dmatlack@google.com>
>
> PCI: liveupdate: Adopt ARI Forwarding Enable on preserved bridges
>
> This commit adopts the ARI Forwarding Enable bit from hardware on
> incoming-preserved bridges during a Live Update, even when pci=3Dnoari is
> passed on the kernel command line.
>
>> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
>> index ebc565b4780a1..b5b578355a1b6 100644
>> --- a/drivers/pci/pci.c
>> +++ b/drivers/pci/pci.c
>> @@ -3748,7 +3748,7 @@ void pci_configure_ari(struct pci_dev *dev)
>>  	u32 cap;
>>  	struct pci_dev *bridge;
>> =20
>> -	if (pcie_ari_disabled || !pci_is_pcie(dev) || dev->devfn)
>> +	if (!pci_is_pcie(dev) || dev->devfn)
>>  		return;
>> =20
>>  	bridge =3D dev->bus->self;
>> @@ -3759,6 +3759,12 @@ void pci_configure_ari(struct pci_dev *dev)
>>  	if (!(cap & PCI_EXP_DEVCAP2_ARI))
>>  		return;
>> =20
>> +	if (!pci_liveupdate_adopt_ari(bridge))
>> +		return;
>> +
>> +	if (pcie_ari_disabled)
>> +		return;
>> +
>>  	if (pci_find_ext_capability(dev, PCI_EXT_CAP_ID_ARI)) {
>>  		pcie_capability_set_word(bridge, PCI_EXP_DEVCTL2,
>>  					 PCI_EXP_DEVCTL2_ARI);
>
> [Severity: Medium]
> Does returning early on pcie_ari_disabled leave PCI_EXP_DEVCTL2_ARI and
> bridge->ari_enabled set to 1 if a new device is hot-plugged after the
> preserved devices below the bridge have finished Live Update?
>
> When booting with pci=3Dnoari, pci_liveupdate_adopt_ari() sets
> bridge->ari_enabled =3D 1 while bridge->liveupdate.incoming is set.  Once
> the preserved devices finish Live Update and bridge->liveupdate.incoming
> is cleared, hot-plugging or rescanning a non-ARI multi-function device
> below the bridge causes pci_liveupdate_adopt_ari() to return -EINVAL and
> pci_configure_ari() to return at pcie_ari_disabled without reaching the
> else branch that clears PCI_EXP_DEVCTL2_ARI and bridge->ari_enabled.
> Because bridge->ari_enabled stays 1, next_fn() calls next_ari_fn(), which
> returns -ENODEV and skips enumerating functions 1..7 on the new device.
>
> Checking !pcie_ari_disabled alongside pci_find_ext_capability(dev,
> PCI_EXT_CAP_ID_ARI) instead of returning early would allow the else branc=
h
> to clear PCI_EXP_DEVCTL2_ARI and bridge->ari_enabled.

Yes, but only in a very narrow case: the next kernel is booted with
pci=3Dnoari, the previous kernel enabled ARI Forwarding on a bridge above
a preserved device, the preserved devices below that bridge finish, and
then a _different_ multi-function device without ARI is hot-plugged below
the same bridge. The only impact is that functions 1-7 of the
hot-plugged device are not enumerated. There is no corruption or crash.

I don't think this is worth changing more PCI core code in
pci_configure_ari() for in this series. It can be addressed in a future
patch if someone really wants to do that.

The comment in pci_liveupdate_adopt_ari() can be improved though, since
it claims ARI Forwarding Enable is always recomputed after the preserved
devices finish. I will update it in v12 to document the pci=3Dnoari
behavior:

diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
index 493576119a76..7582b87df3ad 100644
--- a/drivers/pci/liveupdate.c
+++ b/drivers/pci/liveupdate.c
@@ -937,9 +937,14 @@ int pci_liveupdate_adopt_ari(struct pci_dev *dev)
=20
 	/*
 	 * Unlike ACS, only adopt ARI while the bridge is incoming-preserved.
-	 * Once all devices below the bridge have finished, recomputing ARI
-	 * Forwarding Enable yields the same result for the same device, and
-	 * must be allowed to change if a different device is hot-plugged.
+	 * Once all devices below the bridge have finished, pci_configure_ari()
+	 * configures ARI Forwarding Enable as usual the next time a device is
+	 * added below the bridge, e.g. if a different device is hot-plugged.
+	 *
+	 * The exception is pci=3Dnoari, where pci_configure_ari() does not touch
+	 * the bridge, so the adopted ARI Forwarding Enable persists after the
+	 * preserved devices finish, even if a device without ARI is later
+	 * hot-plugged below the bridge.
 	 */
 	if (!dev->liveupdate.incoming)
 		return -EINVAL;
