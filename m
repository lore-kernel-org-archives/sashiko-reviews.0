Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630594;
	b=dGiww/wTWzNpMPU7RkZv6sr2TNZg6yeWBLDT8e7minoWLqeKPujct8gQkHfYFj8HgU5I
	 6x1zL+e/MLVF8S6PMjvCGkNu22L8WJOersI85pU1UqAWILX5luXE1YiuGtJuv6johTDWM
	 3XJCAFO4z0rq38PZfxM2MjhMvWNwD7WFxOTrO1vxJmcSYbXsscRkvqWBVKjWOFhyXKSwx
	 lWVQJt/hUIMfGyzNkZCQdLtqEAtQTlAKbP5kJanXVA4BjyOawFCS6rSeUncw+bYrKcZwo
	 0XVoVG023ox3ovJ+rHDOLFz272zeOtt6tymmlz2YLxKUSwLsNEetfAmD6IlszyaxnBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630594;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=CjWm5/UHo+r5udk/y7h+H88lRIb30cpagGaa9Im8Ykc=;
	b=5j7ig0niQc0OzmJo6W5RHjU94nETkKLdve6AARg1bnzg2/8f7pP2EJd59jZSnBfVd/H6
	 WhPjUQW7xvJfM5pYTHZWGL04oK8IHdXizg8UE2649wgQjEtYLoc+k7HQGfgv8Kohn42wC
	 tnQ0/rlMD8GHjd8F0O5OXGCtkdHqLM7sLJihQMY6eGcnk7+8tEGOCt1pBn140y7HZ2oam
	 7BVxgu0YEEiZ8urART84EgLuRVH3iOJpG5DruIMhLWGOgK8gaJzEoAK7yM4dn5o9ZgodR
	 yWTnIyVk4DkDmi/WiZPxb+8vL4GM2uc/sczlrFG6ELmdLGTZM40g2tnXU+E4dgklKEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--akorn.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=D1G1feGI;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868B8606A33B
	for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 18:16:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 868B8606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--akorn.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=D1G1feGI
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b0c7ab2427so4632577a91.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 10:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795630594; x=1796235394; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CjWm5/UHo+r5udk/y7h+H88lRIb30cpagGaa9Im8Ykc=;
        b=D1G1feGI4qOfZRpiInNwb0vPg3pEahiPHY9t/MnQ2O3CivfWXZi11uzcTp69dwiAqi
         4HsWJYYyAVkjP+OYMO+qxE74hVSaQ4heai1WqRdPdy5TspXvU4MsB++bUdvVxQCWa+GC
         ZFfoMHfjxUfAvDxZXhic9/oyJCw9NhuTGTmxyYKxMODW/0NJDzp9yKUFsPQSDu1cbCDU
         KFnoaDl76Dq3FgWqipxTkGv24gHlAaXt2E9lTeUaCasRiUofltQg//hqTjp1iXwCHYPk
         ZLRDLwQfSJKfiAicyVdu5bE7ka46QGf9fNKSdigC7hq+L3MDOzQ/lqKGicOX2iITwa4T
         E+Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795630594; x=1796235394;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CjWm5/UHo+r5udk/y7h+H88lRIb30cpagGaa9Im8Ykc=;
        b=acJYPPEwRMyN3th0xv5S1iskxGfP9l/jTIC3faEt9j0dQZFCS6DxEGm8h19Gm8EuEH
         XXZ1ix4tSbHTakL6/IMIhW45YhQCV66eDQBg5oK8VTjmZrce0Za3KiMMMNdLoHxrGdF2
         QymgLKtYCjFj11qaYhNHUnNwW0qNSHKFKWIem4t9KdU464ErdpGDbZR2WMacLbPUyQaf
         5Tys75af56sn3JQZsRVBKDeRssbKHeWL6KhbOeO6BOC+3SQTQm2Gb4TCSXUlyCrg1VYV
         pwkc+UEFbiNmyla5lylnsfq5gnkmr7zSkWgOZmFY5Q/xjkpe5rvABe1eOAQDpjULTim0
         phqQ==
X-Forwarded-Encrypted: i=1; AL+hErHEqKxFtL+jZeHy6gXI3TSv1PtWRwg39PhgFptvWDC9wWkt/al4XV6vI4+3CVc1bgVyT0m94Tytnox9L1pwhY4=@lists.linux.dev
X-Gm-Message-State: APuU4Z/xl6M1m6hx4h+Mt2eVHR8NBp0GOU45OUMMZdx/apfEbJk9mEap
	MpF7iPVJGKq4jX8Xzbt0pWQ9F53vktAgm/3/vdy8zUh7W1TlaOBzIixZUyvm+hhvi2qdFF7IVe+
	3hg==
X-Received: from pjyf11.prod.google.com ([2002:a17:90a:ec8b:b0:3b4:3d61:7517])
 (user=akorn job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:17cd:b0:3b0:99f8:eba8
 with SMTP id 98e67ed59e1d1-3b41c97c45emr17900418a91.66.1795630593453; Wed, 25
 Nov 2026 10:16:33 -0800 (PST)
Date: Wed, 25 Nov 2026 18:15:44 +0000
In-Reply-To: <b5910c74-7e29-4138-9dd4-030c95c78ec3@roeck-us.net>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261125053711.3098007-1-akorn@google.com> <sashiko-outbox-232631@kernel.org>
 <b5910c74-7e29-4138-9dd4-030c95c78ec3@roeck-us.net>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125181605.3299785-1-akorn@google.com>
Subject: Re: [PATCH] hwmon: (pmbus) Fall back to CLEAR_FAULTS when STATUS_CML
 is read-only
From: Arthur Korn <akorn@google.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Arthur Korn <akorn@google.com>, sashiko-reviews@lists.linux.dev, 
	linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On 11/25/26 07:53, Guenter Roeck wrote:
> On 11/24/26 21:49, sashiko-bot@kernel.org wrote:
>> [Severity: Medium]
>> Does clearing data->has_status_cml on any negative return value from
>> _pmbus_write_byte_data() disable STATUS_CML write-1-to-clear across the
>> whole device when a driver exposes a read-only virtual page?
...
> Seems real. Arthur, what do you think ?
>
> [ PMBus is really annoying :-( ]

Confirmed -- Sashiko's finding is real.

I tested on a system with 30x MAX16600B.04 VRs driven by max16601 (which
sets PMBUS_PAGE_VIRTUAL on all 3 pages because the chip NACKs PMBUS_PAGE
0x00 and latches INVALID_COMMAND):

  - Page 0 (VCORE at addr) and Page 2 (VSA dummy client at addr + 1)
    both implement writable STATUS_CML (0x7e): writing 0xc0 clears
    latched INVALID_COMMAND | INVALID_DATA cleanly to 0x00 on both I2C
    addresses while preserving other STATUS_CML bits.
  - Page 1 is a software-only virtual page exposing vendor registers
    0xf1/0xf2 (IIN_SENSOR / TOTAL_INPUT_POWER); max16601_write_byte_data()
    and max16601_write_byte() both return -EOPNOTSUPP for page == 1.

With v1, pmbus_clear_cml_faults() hit -EOPNOTSUPP on page 1 and set
data->has_status_cml = false for the whole device, causing page 2 and
subsequent register checks on page 0 to fall back to CLEAR_FAULTS.

In v2, I moved data->has_status_cml = false inside the readback check so
it is only cleared when _pmbus_write_byte_data() succeeds and the readback
still shows PB_CML_FAULT_CLEAR_MASK set (the read-only STATUS_CML case).
When _pmbus_write_byte_data() returns an error (such as -EOPNOTSUPP on a
virtual page), only that call falls back to pmbus_clear_fault_page(),
preserving the existing behavior from d9d30e1cb9ca.

(Side note noticed on the live MAX16600B.04 system: untouched devices boot
with status2 = 0x0002 / status2_cml = 0x80 latched on VSA because
pmbus_check_register() and pmbus_check_status_register() pass page = -1 to
pmbus_clear_cml_fault() / pmbus_check_status_cml(), which targets the
primary client 0x69 instead of data->vsa 0x6a when probing page 2. Happy
to look at that separately if useful.)

Sending [PATCH v2] shortly.

Thanks,
Arthur
