Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795201877;
	b=JWc2+0bexYDaftZXyoGDER/fjAIcPp3xQT+lxOzBlXzNWjl554raMOblkeGMb1rYJ7AT
	 JUGdGxOAWKfNpXDzOXPZ5aACjK1sWE/WugxG06lE4u01G2CWGimvsalgKjJLuLFTbVozP
	 8RVrrREvD7R2xSfkSUcBhMMHwTKZSKjDQOuqTn0veG9ncnWju6dSQyQ1DnwTBZhKSn/hk
	 73TLHFmPY2yFOLDQFk/Us2DLxBw+rthHqD42A9io6l0T0pd1vUgSAmfU3oLUFl6x0TbDP
	 8+Bf3EJjFd+uwjuJeto7Tn9M5fBSmQjUqNQZd23wQ2SfMwMkx52FOTYy3JOldnCc9qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201877;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To;
	bh=ckLOMz2fV3kY9YEywvc/HmidWwaCPHWXqmOxBtkfgk0=;
	b=S4/4l05z2EiRoZbFpJijTYglwPcK8EuydGEgsWkXvshYSF8lMxthgEDEvNQ+7fBjo6F9
	 6zIxDYes0wPommQO+ZgTDlkXsfSDQ40WbBn96Su/mscY+P3gKzcDfHbp/A0Sn0AupkmqU
	 muAaBEHsnDisXef0/Fw4xGu7KagtuVJ+y/aR00Tlx9cKT5Cfulg6waL/rVDJE7drLi2mw
	 BhumA8Y31tGTAN0QlIt14oR4ADT2VGQB25WWh0hPFeCA3HUzyvIyTGJwJ7hqIAHlwnNMI
	 7eLEpgjDBwo4ucQA/rD8A0jo2FA+broo70ZsGtxYaObyVDU0HUC8BsxUd2Tzr9J4qCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="Xsypcd/v";
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8AC60A2633
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 19:11:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D8AC60A2633
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Xsypcd/v
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2f03eeda984so6854675ad.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 11:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795201866; x=1795806666; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ckLOMz2fV3kY9YEywvc/HmidWwaCPHWXqmOxBtkfgk0=;
        b=Xsypcd/vk6IwcHtmrSCwKtPTEo7w8xVcMMKD+Fpu4FhcSsJj/K5DMY1XYm1DmvvHMk
         iFe2p/NjTccLg+3qsSGko6xVzFlUhTU+0m67ZGYFapjiSoAoaJW2GG9ziXWFRT3ts3oS
         UWq+RSZae4agf2NJYkh6nNG+UWO6XIgyxp2SQQBWnH/cYEXL8uuCKROMe6TVM9wK9o/V
         gWP4zdCWDdv6eu7eHQylKM/1QOAy/p9xqlqlVrabvLuuAHmyKhU4sePOjHAAuwqOpgGu
         NFxkeuOQfennsNVw97k3Dvg3m874Oft/HHsMkS21Gbp/CsgP9zLk+x5REwiTCgLjdrgq
         Ky4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795201866; x=1795806666;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ckLOMz2fV3kY9YEywvc/HmidWwaCPHWXqmOxBtkfgk0=;
        b=P7+BsHxKzBL3GiDGCaqOKcS5rNYLtsAEo49dTllwsiFQkzXYxVMHFSs6CUMyX7mZP/
         w73/9Qb9qlq69B0EgmJFKI+ec7mbNQduAL1fArid7EIsR5/MmSh3UdO6KdKBkbeZ1CTz
         ea6GN6GuXue6Br5vf6G9a1v1LA57aCYyGsrn4lFBvuC6A6zz4JtbB71e83+vkXoIqYYK
         xgni0wQkpj18bdHiJW5MPEfNSI8nZd+FMKQh4rx84eyQkzZOjxC/FSIR02O9fDKqgagx
         b6AF0waISeQJzWUQkYRWP9r6TjtJnWIWGCcyCqfO2DMp2pPW0W00tL28+w5Ue9Mz39PB
         vMMQ==
X-Gm-Message-State: APuU4Z8DXb2wgFu+U6kKFWC+2su2MHOezsFW6mBCD6gqLPwlGosIFq7F
	/X4r1L4Y5QBh6sTTy5nhMTvHtNX/4uEpbyctP/rH/rP4HUw1WLrFATq68gYePzH9By0oFFDuafK
	LH3CICeOC
X-Gm-Gg: AZFdTZc36OzULLJNLHLUKdCSNs3sKEfMelaJx05DNRGe6xmiY57lY0jFU52fD2zATpb
	s6xDMnKVMS1b9GHEVc/PIoU4f15EpviMCFZ/ppYYcLGNAYx0fHRA7eWWz9mTnJ0sypWzxsQKm2m
	CeLT41oKV0TMHL65tyt0XT2t71TaPExEpaBqvhby0GaYZjhLx/poSuJdip8HlOlngkHQuPMhR0d
	nJ0zzhW6nIyCmUyjvIZXxOiaf4g4YTnH0Qa5SzBkSgLBNqDadYgVkK/pvC7ETh9WQ7i1cD3ZvEt
	ojFr2EJZU1OxIZbKWNiA3woxz+6MlDc6xNddt0pp2Kcee2zncxB4HfJjBvkxLUSjARyB4CWMbnS
	IsERDbJ040m5wjkVtbboV64W5Im7fM3NsTd8nPHGraaPej6RRfU6NQUatRqLLomla2twqyvYjUG
	vrNlKWud8d+tj3zdObw4LWSfBWvuwxZK8TUrvIb0VuGTecy8gj0YUdQcfgMe0sAK/hCjEAYEiAs
	62MSdBjoEbfawnJJhrlSefx93D10ndrEyusYQB8s+cZlRv4YeSRfROA3/wX/3OomdAJR/on+o+v
	pZZOXWg1dczU4+zwKPydENi9R3i5CCcEe2N8WRJdTVG8vT54vyNV9SyDBJDu1KUD
X-Received: by 2002:a17:903:3b8d:b0:2e9:5714:6079 with SMTP id d9443c01a7336-2f03f1a4a0dmr40668915ad.31.1795201865671;
        Fri, 20 Nov 2026 11:11:05 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1413f3sm17535745ad.68.2026.11.20.11.11.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 11:11:04 -0800 (PST)
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
Date: Fri, 20 Nov 2026 11:11:04 -0800
Message-Id: <DN09Y7673R13.3GB4PTE9ZPXAE@google.com>
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
Subject: Re: [PATCH v11 11/13] PCI: liveupdate: Freeze preservation status
 during shutdown
From: "David Matlack" <dmatlack@google.com>
To: <sashiko-reviews@lists.linux.dev>, "David Matlack"
 <dmatlack@google.com>, <kexec@lists.infradead.org>, <linux-mm@kvack.org>,
 <linux-pci@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20261118223704.3286085-1-dmatlack@google.com>
 <20261118223704.3286085-12-dmatlack@google.com>
 <sashiko-outbox-224146@kernel.org>
In-Reply-To: <sashiko-outbox-224146@kernel.org>

On Thu Nov 19, 2026 at 2:38 PM PST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] pci: liveupdate: panic on session teardown after
>   pci_liveupdate_freeze()
> --
>
> commit a3120ec70b92ea26f3e1d92d3bd0d1531b5a73b6
> Author: David Matlack <dmatlack@google.com>
>
> PCI: liveupdate: Freeze preservation status during shutdown
>
> This commit freezes a PCI device's outgoing live update preservation
> status in pci_device_shutdown() so that devices cannot be preserved or
> unpreserved once shutdown begins.
>
>> diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
>> index a45ad86370d5d..e26d2f5c2338c 100644
>> --- a/drivers/pci/liveupdate.c
>> +++ b/drivers/pci/liveupdate.c
>
> [ ... ]
>
>> @@ -520,6 +523,11 @@ static int pci_liveupdate_unpreserve_device(struct =
pci_flb_outgoing *outgoing,
>>  {
>>  	struct pci_dev_ser *dev_ser =3D dev->liveupdate.outgoing;
>> =20
>> +	if (dev->liveupdate.frozen) {
>> +		pci_warn(dev, "Cannot unpreserve device after it is frozen!\n");
>> +		return -EINVAL;
>> +	}
>
> [Severity: High]
> Can rejecting pci_liveupdate_unpreserve_device() on a frozen device trigg=
er a
> panic in pci_check_all_devices_released() when a Live Update session is
> closed during a non-kexec shutdown?
>
> Unlike kernel_kexec(), which calls liveupdate_reboot() to serialize sessi=
ons
> before device_shutdown(), non-kexec shutdown paths (kernel_restart(),
> kernel_halt(), and kernel_power_off()) call device_shutdown() ->
> pci_device_shutdown() -> pci_liveupdate_freeze() without serializing Live
> Update sessions.
>
> If a task closes an open session FD with a preserved PCI device during or
> after pci_device_shutdown(), luo_file_unpreserve_files() invokes the file
> handler's .unpreserve() callback and then unconditionally drops the outgo=
ing
> FLB reference:
>
> kernel/liveupdate/luo_file.c:luo_file_unpreserve_files() {
>     ...
> 		luo_file->fh->ops->unpreserve(&args);
> 		luo_flb_file_unpreserve(luo_file->fh);
>     ...
> }
>
> Because dev->liveupdate.frozen is set, pci_liveupdate_unpreserve_device()
> returns -EINVAL without decrementing dev_ser->refcount or
> outgoing->ser->nr_devices.  When luo_flb_file_unpreserve() drops the fina=
l
> FLB reference, pci_flb_unpreserve() calls pci_check_all_devices_released(=
),
> which panics because outgoing->ser->nr_devices is still non-zero.

Yes, this can happen, although only in a narrow window.
kernel_restart(), kernel_halt(), and kernel_power_off() do not freeze
userspace or serialize Live Update sessions, so a task that still holds
a session FD when reboot(2) is called (e.g. reboot -f, which skips
killing userspace first) can close it after its devices have been
frozen. In v10 this only resulted in a warning, but the panic added to
pci_flb_unpreserve() in v11 turns it into a panic during reboot.

The freeze only matters during kexec. pci_device_shutdown() only checks
pci_liveupdate_is_outgoing() when kexec_in_progress is set, and
kernel_kexec() serializes all sessions via liveupdate_reboot() before
device_shutdown(), so nothing can be unpreserved after devices are
frozen.

I will fix this in v12 by only freezing devices during kexec, so that a
non-kexec shutdown no longer refuses to unpreserve devices:

diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
index 08b768b9e905..2748ca22e9cf 100644
--- a/drivers/pci/pci-driver.c
+++ b/drivers/pci/pci-driver.c
@@ -560,7 +560,8 @@ static void pci_device_shutdown(struct device *dev)
 	struct pci_dev *pci_dev =3D to_pci_dev(dev);
 	struct pci_driver *drv =3D pci_dev->driver;
=20
-	pci_liveupdate_freeze(pci_dev);
+	if (kexec_in_progress)
+		pci_liveupdate_freeze(pci_dev);
 	pm_runtime_resume(dev);
=20
 	if (drv && drv->shutdown)
