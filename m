Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1644F526091
	for <sashiko-reviews@lists.linux.dev>; Mon, 19 Oct 2026 14:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421520; cv=none; b=DDoreKZj8FcaVEbVDWsXUPEVJ+GERHjeXuowz6AJOwpn3G1SNzE3il13O9A/GenFP1S5fduJTNgj6fcsOEe790dhr8VJbodnZWYgQ9GVBDovK+vATnycxq/AlFGK62Ph622tA9AbbWckmKmlfVmX3I/GU2lcVNC0CGCmAMwqSpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421520; c=relaxed/simple;
	bh=BfocLhumB1fGZxHu/mtdCb1aY9ZLnRM2UcKaUhQFaqo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fphpcPDxhDXNMyYO2txjmC7X4XvvG2c9h0VCGjQvWX7jDloZcu0vxFSkqXEBoZ5azGj2+D68Mkj42tEW5sKRyz2d6LnYOmUxopokCuATmeAY4oTvsvgyFCPxDhFdmkf5tVEgki1cY7R9EZ4z37BOSkF0+LtZniv52K6CdPocTVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ektzJOa1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ektzJOa1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792421518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BfocLhumB1fGZxHu/mtdCb1aY9ZLnRM2UcKaUhQFaqo=;
	b=ektzJOa1JZNQBaVjBDTITXjLP1HFvqRUFeBOJ4+yWE1/k9HmNftBb6LSGpojly0UqEvWk1
	cvsL10F/JR049wpsWYZ5EVL7cDB0PMyJ7QLcLHgiDmvCJZhkukZWicoQ3nIns7+yG7ZKbI
	vtylXWGKn7ot1SKZB+YmrlPi455xWfM=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-93-_S6GIhVMPnKbF9HKaNxZ2Q-1; Mon, 19 Oct 2026 14:51:56 +0000
X-MC-Unique: _S6GIhVMPnKbF9HKaNxZ2Q-1
X-Mimecast-MFC-AGG-ID: _S6GIhVMPnKbF9HKaNxZ2Q_1792421516
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93909014c85so498579785a.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 19 Oct 2026 07:51:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421516; x=1793026316;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BfocLhumB1fGZxHu/mtdCb1aY9ZLnRM2UcKaUhQFaqo=;
        b=eUbjMwtqbOtzlUm0722cJIau8zglYYlWrFogq6Q3ie4iqe24TRiOLLHdHbzUrz4rHB
         j18J94fMguFemV6BHoIcYYMqBi9hoLN2X0b5a8YvzXjuxCvjjjvH8k9fUfTCkNGEnu7q
         cNnoXPtQ4+oLp37TSqAL+K02zOyww8eBwkI763+DEwMCl9tQ5sfWP76mcNAdu221v87m
         y5q8ejroIiboJ90e0IL/kurixu/o3i0458bpUaL2bjk0H3EmVAI0fgV0oiQEef7Zrkoz
         CJYDnT92rzoo8mACW4vYWZqq1vZ/iJW96ll5OEcZnlMrStBLbJVzS0qBzhmQ29FEUy0B
         hwwQ==
X-Forwarded-Encrypted: i=1; AKwUvBwopIDnCkMroP8daM5tAQ79OT5UrVbTOKutG9e9RiHT0Y7RALM3U8Bq+CoV+eTWGDnsyDCx97FTrUo9sY06Lkc=@lists.linux.dev
X-Gm-Message-State: AFq9FYJQeqFelfZyRdGVv46Z00ZTYFmmbA3jZtYmDAHhH6JO5GRLGdLO
	qBJPsaXPlN/HtXpY08XyUZwwPrGsBFp+jIQLK9EJolVIGPdBmOwDKlk1SU/x2XGSqppESYDgl3U
	DzU89mZksvUAFi3pd7K3Xg5ZeBTHiW8+SBcimYLfjPESXw86+gll1MhaIOxVG6ze38ggbv8xOmO
	Tp9Q==
X-Gm-Gg: AYBFou2bsVrzrVFBdq2FRfiIX3D/41k4tTp93Gd+BpN4xWkJFQTox9UkRCpE+piAesz
	mFy688hPkWGNEsLJK8i1+rtIcAl4ED10P+5ShwG7JSfbAe2bOuRe+/ZHFQWAmg+9Z2QV+Lnvd6C
	3/6cSRFw0eRXRsZiBkJTmprQNt1G7Sg/NrQI1KvuQCMMpw1j3jFvcWbQee6UxmXgpS3FKYACiaS
	469XD1n2CEEjrxYtlJ8DcNIvULIo43paIrRY0EDB2xK0oql9N+Yo7rnulKFtX6hk2SXe+FtIbsg
	YdmcJOkahLYgd0HjStRmlSgiAp7srg1DrvcUL9wLZTmYMDE20hyT1xKMWlxTJl8wgIgSoFJRJ1R
	iNBRWaqfxGWBotyARtZjGfg==
X-Received: by 2002:a05:620a:1b86:b0:93e:6f65:de63 with SMTP id af79cd13be357-93f29d0ed53mr1300749485a.47.1792421516062;
        Mon, 19 Oct 2026 07:51:56 -0700 (PDT)
X-Received: by 2002:a05:620a:1b86:b0:93e:6f65:de63 with SMTP id af79cd13be357-93f29d0ed53mr1300743085a.47.1792421515388;
        Mon, 19 Oct 2026 07:51:55 -0700 (PDT)
Received: from loberman-thinkpadp16gen3.rmtusma.csb ([2600:6c65:2440:d8c:aa2b:ddff:fe88:da74])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f3c61c440sm353019685a.10.2026.10.19.07.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:51:54 -0700 (PDT)
Message-ID: <94b5d467f5ad5bffb8b958104fcff2bfa07dc085.camel@redhat.com>
Subject: Re: [PATCH v2 3/3] nvme: document the service-time iopolicy sysfs
 attributes
From: Laurence Oberman <loberman@redhat.com>
To: Martin George <martinus.gpy@gmail.com>, Guixin Liu
 <kanie@linux.alibaba.com>, 	sashiko-reviews@lists.linux.dev
Cc: linux-nvme@lists.infradead.org
Date: Mon, 19 Oct 2026 10:51:53 -0400
In-Reply-To: <1af1ff8db7803c1b8f8e656eebe249cbe5e622b4.camel@gmail.com>
References: <20261019075607.808947-1-kanie@linux.alibaba.com>
		 <20261019075607.808947-4-kanie@linux.alibaba.com>
		 <sashiko-outbox-176783@kernel.org>
		 <acd6eee9-dadb-48e3-9a9d-232a268472d8@linux.alibaba.com>
		 <c4b6b7cfd51a498df8aaa7f5bc5cef9a0605b733.camel@gmail.com>
		 <1a84584bc9cf64fab6b4e17bdf2050f9b176ad6a.camel@redhat.com>
	 <1af1ff8db7803c1b8f8e656eebe249cbe5e622b4.camel@gmail.com>
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3wbw04q2LoTo73ZgFUvGbM7buxIpdmvl3TBLH_z-a0k_1792421516
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-10-19 at 20:16 +0530, Martin George wrote:
> On Mon, 2026-10-19 at 08:43 -0400, Laurence Oberman wrote:
> > On Mon, 2026-10-19 at 17:43 +0530, Martin George wrote:
> > > On Mon, 2026-10-19 at 19:13 +0800, Guixin Liu wrote:
> > > > >=20
> > > > > Should "service-time" also be added to the accepted values
> > > > > for
> > > > > /sys/class/nvme-subsystem/nvme-subsysX/iopolicy?
> > > > >=20
> > > > > =D9=87=D8=A7=DB=8C=DB=8C
> > > > Sure, changed in v3.
> > >=20
> > > Not just /sys/class/nvme-subsystem/nvme-subsysX/iopolicy, but
> > > this
> > > should be added to the accepted values in /sys/class/nvme-
> > > subsystem/nvme-subsysX/iopolicies as well.
> > >=20
> > > -Martin
> > Hello
> >=20
> > There should be no changes needed for my original iopolicies patch=C2=
=A0
> >=20
> > iopolicies_show() walks ARRAY_SIZE(nvme_iopolicy_names), so whoever
> > adds a service-time policy adds its enum value and its string to
> > nvme_iopolicy_names[] as part of that work. The new name then shows
> > up
> > in iopolicies automatically. The existing iopolicy store path
> > already
> > matches against the same array, so both attributes stay in sync
> > without
> > code changes
> >=20
>=20
> I meant adding to the iopolicies documentation here.
>=20
> -Martin

Thanks, makes perfect sense
Regards
Laurence

