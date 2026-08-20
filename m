Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89912480326
	for <sashiko-reviews@lists.linux.dev>; Thu, 20 Aug 2026 17:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787246946; cv=none; b=WZfGnM2a9INnMRmnIjxshe3bW6NmlzeEkbknS/dslQDaj9QP63LhwPEjkoDr+p0jYUHK0ngGwTGfUZjMzNBal0gQkOxKmEq9I4SVKbJNO2WiIMkkdDHCLLEButPp4lwBq+MRR0VGsNjCf1OdpSHxYHiRibJxinsO9r91dikNzQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787246946; c=relaxed/simple;
	bh=2THSxdc10N3Uu73ngO9PWmoQr8ld0v1dmliCiNyRQnc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LoOEY64BC97FU4J2VuRi9F8UC7XnVktgznZLcBoUz+scXXQnxT6kZW1QGIp+FjNFOb6iwldo2W7SbHH+1hk3v5qTL3QVSv5FlEP2pYvKw/hEGJ3MmaevLiVvM8b5tyb83alTDqcCV5Hgs1oMEdibfC1A9amoqHpKQFBcy/MEq/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RiUPY0fb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RiUPY0fb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787246944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2THSxdc10N3Uu73ngO9PWmoQr8ld0v1dmliCiNyRQnc=;
	b=RiUPY0fbFi6WM+P5eGcQXIXVI+awlmWKapm19iKSnAggw1Ue2gG9/O2t0/cqGB8WW+aUZ/
	M+vAEIjcY4W4flE+vVBOu9NIpz/CRC3WvUPoctqb4CAPQkVZOKQcKj+lM31/YNjkCPbMzv
	nhmRbT5Y41kueBUOCBqwr4e77Nbyct4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-rIfaaVPtO4GZvRDCGkkPxw-1; Thu, 20 Aug 2026 13:29:03 -0400
X-MC-Unique: rIfaaVPtO4GZvRDCGkkPxw-1
X-Mimecast-MFC-AGG-ID: rIfaaVPtO4GZvRDCGkkPxw_1787246942
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-473ac08a6a4so114956f8f.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 20 Aug 2026 10:29:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787246942; x=1787851742;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2THSxdc10N3Uu73ngO9PWmoQr8ld0v1dmliCiNyRQnc=;
        b=P8/WxuiE/GEBJ4vQYg7UfkcNS7wfBWSfoB3QrNEgkus6ue78VKNBFxfc66MzNu/G1J
         X1c9ZgCZsUU7kWoI3QyLzlUJe9BmQrs2qmkwbMVlxMUuIyrypQabJygF8z3LGLcrkvRJ
         WMM1ke+0/Ef5UFNGOyVHO+rC3h9OKcS9nPWKahOo+1j/OXoGp4qFH/kpzPPxF8vYYw7R
         RTj1w25iBUfmxQ9yrbB7IPndQX1MyD0iF+1vIxG8uoW/b2bkUALvYi+LiFL5ZK0diXuY
         l4hU5DDCpM1qvaZMbRlDuxB8OuZi270Tr7v/DwYd8Hkhzv/p98+XrZD7fuvxKycmWE7B
         6oRQ==
X-Gm-Message-State: AOJu0YwLZfxlqjB6s8CB1K00VAkFMjdjKK/RVSYRqiX+lDRfErmAyyQY
	UdcQD6HaO5BMDth+0VP8mAXP1maKO8mHpbVgiroiaa6Fwtu6xN+PvqM2EYmgKMVKeaKT3M/Ur6I
	UpCCDBdR5Ub+tADiQc32glMn9iWugsJFFb33qh1gR/vyXsQ406aWQStq1EOJFrya75PFtT2+cVL
	Ez/3/xSKD8/MnHAW8htPSoZ75HY2D3JBoW0LhhlLB7z+Qp9AkLEw==
X-Gm-Gg: AR+sD110JncaNyQZ/FgJwj6H/vbfxRBrDOpq5CyoR5kuoRKZT8naO8xlL8srQ0r6gWf
	pXgEPlfZC/Vc7qV1E9cvBRfO/o8B2aRJcJY4BbG4+K+VcnrrK/Rz8xL3hfiospdZUGzjoy3vqLp
	WYyJVMh2UZG9+vQ2kHnJWfKFsCzTssA7vSZ6TlvqN9HaKuBWf7CgPhvUKsTZ3Q20ILWqgELLtEb
	VDOU9odDhIlgdihyGxvqZE7ZvJ1w7Bti0TVscBd8W/l1YHFQvbkyKo0IvZqQEzfgxTDhp0NTO0n
	6Zj94U6stvQ4Y3ZMFBaQx17CrSlgO7ML3TrPuGSRbjDFsXt1u9B9ABITe7jrkvu/OaRGbSEQ
X-Received: by 2002:a05:600c:a087:b0:499:a760:722f with SMTP id 5b1f17b1804b1-499b8461acfmr9069225e9.13.1787246942188;
        Thu, 20 Aug 2026 10:29:02 -0700 (PDT)
X-Received: by 2002:a05:600c:a087:b0:499:a760:722f with SMTP id 5b1f17b1804b1-499b8461acfmr9068485e9.13.1787246941850;
        Thu, 20 Aug 2026 10:29:01 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b1441c78sm14050312f8f.2.2026.08.20.10.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 10:28:58 -0700 (PDT)
Message-ID: <b91083f5f3b9448904a9dedbb1879463e7e08e37.camel@redhat.com>
Subject: Re: [PATCH v2 1/6] drm/nouveau/kms/nv50-: Move DPCD backlight
 disable into its own function
From: lyude@redhat.com
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
Date: Thu, 20 Aug 2026 13:28:57 -0400
In-Reply-To: <20260819161409.991131F000E9@smtp.kernel.org>
References: <20260819155934.154125-1-lyude@redhat.com>
	 <20260819155934.154125-2-lyude@redhat.com>
	 <20260819161409.991131F000E9@smtp.kernel.org>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9ls-5jsTaAilcUU1ONvbsIqObzac1nXO5zge2fEeKK4_1787246942
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2026-08-19 at 16:14 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
>=20
> Pre-existing issues:
> - [High] The encoder atomic disable callback invokes sleeping
> functions via the backlight disable helper.
> --

Hallucination. It's treating the atomic disable callbacks as if they're
atomic in the scheduling sense. They're not, it's just the atomic
modesetting API. Sleeping is fine.

