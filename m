Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8607283FC4
	for <sashiko-reviews@lists.linux.dev>; Mon, 19 Oct 2026 12:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792413815; cv=none; b=QpMI7CaEA8SZJrjE8t0GVxq5NwVt0PtNAb4e3Uw+0gUGPQr0Av2AuOdbYpyIVHGz6qefrudClYb6dLSh4xbdswCbz1Zr0pyH0M+yuRu6IwXSpoei+44xJziK2X69YN7qrKV2KUbco7cm+ZSe79bDCWlfL+qqRWjU7FkDlOT0kZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792413815; c=relaxed/simple;
	bh=BSQQWhEwYzqsSK80U6a+jDAT9oZq8I0PTtw89JMbS0E=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WZrXdAxmGkpzGsnz4U99lysgCmOLIPkHEYFTD0W1hjEwo67OkBl+0g6wlnTp7fINoRwLbdMCtXDNV5RIfdlc1v874FMx3swLDwB5O20eX2CVFCD6EFWRHF4MX6b7ySXaW5/Msc17febKvFy4XM2IV6sctukjIe1Bw18VjO7CE3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CT3euGW9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CT3euGW9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792413812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BSQQWhEwYzqsSK80U6a+jDAT9oZq8I0PTtw89JMbS0E=;
	b=CT3euGW97DPyA8QVm/lSQTV1orpFuJKaRgbhgPHSN4CN4do9NBj65z5URFgQfrg+BS2Csd
	EavZZPY2l+7NdwYqWlUHtVWOeButlYexAojwPAegBQnqR/0JG2aN9sP8sX6WJ1UorSu2kK
	0rDlj9aGXw72fgReQTbbpYKxHY6KM7U=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-497-L8Jg0XuuN_esCQsF4-7hXA-1; Mon, 19 Oct 2026 12:43:31 +0000
X-MC-Unique: L8Jg0XuuN_esCQsF4-7hXA-1
X-Mimecast-MFC-AGG-ID: L8Jg0XuuN_esCQsF4-7hXA_1792413811
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-6768601940bso5221874d50.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 19 Oct 2026 05:43:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792413811; x=1793018611;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BSQQWhEwYzqsSK80U6a+jDAT9oZq8I0PTtw89JMbS0E=;
        b=obQ9EUIoSVZ3NUMMU6f3Vv36zzd9NViLFO2zmwUv8fg47WZSh6Nfzr12rOif+31c4Q
         RS7AldKybPYF3G9I+4eNIkauZ/21sS5tipJxicfP2WLk6rSKd5i0trI8ZjOelbG9fXHh
         dDrQzJCzC6IuLISOs/t3ByMuAQG8niF1IIvO2ORINAlDSWwvaY8c1iEmW/rfeU8a3ICm
         dyeQBMoNhXEmNdWJeZIdSTAeagh0nP5OFaRES5UHrCpnEs7vqAiyKhnEJ5ZwgSV0aLwD
         0piKjaWWfvnAO3eMwlmsFOgmHaZW7/W0w5lfbiWugOhub5dJqat+OdJxA374cReOM/pr
         alIw==
X-Forwarded-Encrypted: i=1; AKwUvBwXsEQ+ZAq+Adgy/WiiHUBLVjzcfJ7jvmVX3p/bU81H86LhRcDa9EEluyIX8L5KYY9ONqL+zJG2IBOWG/3rlh4=@lists.linux.dev
X-Gm-Message-State: AFq9FYIo/FKcC5ew98IcvkIP1VmAhYSG6VorUuAFL5P0JRL/d3hu95bd
	TmOQ9ibcMZhCxKCqMxHbazUFEU9F9+9AYsxvxXCXf8GlbONn6FzfjsgKCmHZPotHyh2YyOAxXeB
	gB4gR9rkisDXRC8vDpWOA8isHXWdFhmrhVlcVzaztYEOaJmEvbKf/oU5N1rQJsbFc35etVg==
X-Gm-Gg: AYBFou0mJo47GYEo09Do8c6RmrmkOV+Sr0pboD8d/IFroxP5xG+b/hZGNjoiZB3GH+P
	dXDmI682m7WUjvIWLHnCauWnal67Hvu47MlFm8VipO3kBxtSQGS4TGgXJps9bUL/BBjmmYfY2MO
	2Y5SzVsBdiwkcfAheRwtQxzBKGKaaas/MWogh7yhpUTF3P/21agkHszwEn9BGgq4ZWomZH/xaZo
	3gXyqkxiEMNrbOvP0sQbdzoJ0K6qWWM932MeqDW3wdyDSQfoXYpBaeDNFXQMvvWCUlIlTrN0FoS
	CAb5IECy8F0zff1jp+or09p9GOeDoFzelG/YHkskrt0rMW0OL8TfLNrEJ5szuQWKeXtf6WETjAb
	BvDDvgLKAaNNgdA4r3C3pNfvGnZMq21xUpPnN
X-Received: by 2002:a05:690e:1517:b0:677:a948:8d50 with SMTP id 956f58d0204a3-679ca8268eemr2007997d50.14.1792413810818;
        Mon, 19 Oct 2026 05:43:30 -0700 (PDT)
X-Received: by 2002:a05:690e:1517:b0:677:a948:8d50 with SMTP id 956f58d0204a3-679ca8268eemr2007993d50.14.1792413810372;
        Mon, 19 Oct 2026 05:43:30 -0700 (PDT)
Received: from loberman-thinkpadp16gen3.rmtusma.csb ([2600:6c65:2440:d8c:aa2b:ddff:fe88:da74])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-679b1f1ccadsm4040764d50.22.2026.10.19.05.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 05:43:28 -0700 (PDT)
Message-ID: <1a84584bc9cf64fab6b4e17bdf2050f9b176ad6a.camel@redhat.com>
Subject: Re: [PATCH v2 3/3] nvme: document the service-time iopolicy sysfs
 attributes
From: Laurence Oberman <loberman@redhat.com>
To: Martin George <martinus.gpy@gmail.com>, Guixin Liu
 <kanie@linux.alibaba.com>, 	sashiko-reviews@lists.linux.dev
Cc: linux-nvme@lists.infradead.org
Date: Mon, 19 Oct 2026 08:43:27 -0400
In-Reply-To: <c4b6b7cfd51a498df8aaa7f5bc5cef9a0605b733.camel@gmail.com>
References: <20261019075607.808947-1-kanie@linux.alibaba.com>
		 <20261019075607.808947-4-kanie@linux.alibaba.com>
		 <sashiko-outbox-176783@kernel.org>
		 <acd6eee9-dadb-48e3-9a9d-232a268472d8@linux.alibaba.com>
	 <c4b6b7cfd51a498df8aaa7f5bc5cef9a0605b733.camel@gmail.com>
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0CMwF2nafFN1Em2gQR_1nkmiWRqvLKP0eVuULXW_1Bg_1792413811
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-10-19 at 17:43 +0530, Martin George wrote:
> On Mon, 2026-10-19 at 19:13 +0800, Guixin Liu wrote:
> > >=20
> > > Should "service-time" also be added to the accepted values for
> > > /sys/class/nvme-subsystem/nvme-subsysX/iopolicy?
> > >=20
> > > =D9=87=D8=A7=DB=8C=DB=8C
> > Sure, changed in v3.
>=20
> Not just /sys/class/nvme-subsystem/nvme-subsysX/iopolicy, but this
> should be added to the accepted values in /sys/class/nvme-
> subsystem/nvme-subsysX/iopolicies as well.
>=20
> -Martin
Hello

There should be no changes needed for my original iopolicies patch=C2=A0

iopolicies_show() walks ARRAY_SIZE(nvme_iopolicy_names), so whoever
adds a service-time policy adds its enum value and its string to
nvme_iopolicy_names[] as part of that work. The new name then shows up
in iopolicies automatically. The existing iopolicy store path already
matches against the same array, so both attributes stay in sync without
code changes

Thanks
Laurence

