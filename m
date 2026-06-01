Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EBB3D810C
	for <sashiko-reviews@lists.linux.dev>; Mon,  1 Jun 2026 15:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780326342; cv=none; b=SCGkpG5NRxiAbzEnmybLLENcOgzXHYh+4qxdvHD7Lh9MxmxbO+Z2szRCA8byBDNrDbqh7Zg1JXi8r0d/o1Hu78+qR+JvJlAQWt75jLUChqzjQEozCCQCmb4EVwYpYr6HXx5cO+vk17HH0f/mfEvhX647uJ0c4ZJslUD7S321bIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780326342; c=relaxed/simple;
	bh=q7U5FdFdnmjh1a24iUampnKh0zlh+cXjbzSGoUU78PU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ph/IJQwIH/f0Kpscps0VO07m7yKzTR8DOZyH/X+Y1zd6V9Z8Fhc0H35Yg1RXT3nTPVaxCOhC7o6S+bj5iJfXT5LMJJ5mALw38AJkpdoyvnBWnfwuUEeN13yULWX31Jm95dHayLUQjwqiyW68t6NA1aYSqDYtgwf6dRGCmQe+dck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=gb5BClzD; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="gb5BClzD"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490a7a9f81bso12111215e9.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 01 Jun 2026 08:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780326337; x=1780931137; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q7U5FdFdnmjh1a24iUampnKh0zlh+cXjbzSGoUU78PU=;
        b=gb5BClzDGciaan5jeLLu1ISnwFt8KHUwBoOdE5UbddS50NY6kzhKNy9qF7NjJvca1o
         y01qX6ImXG9hU4yCOaN4Vv3H57jMPgD2dGIXJMqSf1B9TVjmDCtgt78auoJpsnHRntyU
         vYKY0mBQsBBlA8P2t2cOH89HFfO82KwB8i/anJ6BKGePvGnTMqgH3yxlq1OIzi9E8W1N
         G3QQ5zthLpYtWlZQHND1kANbGdIv1Av7VuUCcUuUgUuC9xUJ+jAC5rQbvjy9ktyIy/SA
         DMgGetZzssWaH/wttC+kWLqWpQcEqR7k6MruIoeh+f+hgUXlrjxVWRP8oTFFN78SyXEh
         8PMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780326337; x=1780931137;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q7U5FdFdnmjh1a24iUampnKh0zlh+cXjbzSGoUU78PU=;
        b=gPB5AoaC14Miasa+cxMzmafMgQw3nlSIOibt7lH6ug/KTcc8ZSi1rylWmXpNtwr9fo
         A8vV46lXwoAMrY+8a4YIxk4Pj3qlKvJ9bQA9S+0DEycf0Nz39kIQv+2tWJbVZxlDzNdD
         f66V8JzQ5TYLZUgj3+p3v/F0Ut0aeJsnvMYzK/abxpCfRbc8vf66Ghbngs1Ix7z3LH0h
         u+R9eOeuhCtja6EyUuS92Pr3WrADCw3m2K7y4nP3NH1b5nAN+SIZMd8o+1dzt08TwarA
         nq8/yM3ZQDd1b1dL4CMw6ghIlKaEMDsHtKhlaXs5LQgvOrXJslVRnbNYLNBpeujs/Z46
         nNAg==
X-Gm-Message-State: AOJu0Yy2kH54ydcvw7OhgUXX+JWaBMWKCLzPktq0sdr4n/zF6IflXpVs
	FWH3Yar0qUxiUkLEMS0XrohVItiM+sPkN9OTNEHdzakvx+srW+HCkMHDpm3vVRfuJbU=
X-Gm-Gg: Acq92OH8EwRFbRPtnMtFHjrsfp6kZJksYoazO65NaXu6fZd7yff+y6SjRi8o1El7dFX
	LGkgkF9rETpBU1bk59lUseFIc39Jhn0bwNVMdjmXmNCjicxe3Df5PP4rUZ3Li5K/1jLjoSTntav
	y6DJK+B1sshS/uBa/vqCwqV9l6MkgKGVGACO3WqvU9dpH2leVJ6siCjD7tf3dPjtQDtPCqCYzUA
	W9SS0lSbQkBSzyIKcV119jt/0xNkzxbEdx9YIezkPgHv7v3RFmj5xCBMgg0QrXhCIPCnPq5/smK
	5HZIxvzv/ta/SV6/ju/dYwhwsg6W67iXJThFdYEJltnqhRMQZ010xidwAr/1Yxj2EQ7r+OnzIAl
	ZkbTmBFtTmE/jl+49qT+icEcLB49dIXNLFIB6bcZkGU77MYXy887Xz8mTGFUuCx1v9O8NSH8AUn
	EpiSu9F/04IY+u44dJHRqTwxN4PXZJAJjC+uqLMfPfaD6N7rnbVw==
X-Received: by 2002:a05:600c:628f:b0:490:b0bf:7606 with SMTP id 5b1f17b1804b1-490b0bf7735mr1174895e9.16.1780326336796;
        Mon, 01 Jun 2026 08:05:36 -0700 (PDT)
Received: from localhost.localdomain ([62.77.90.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef35598e5sm23651887f8f.27.2026.06.01.08.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 08:05:36 -0700 (PDT)
Date: Mon, 1 Jun 2026 17:05:34 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Waiman Long <longman@redhat.com>
Cc: sashiko-reviews@lists.linux.dev, tj@kernel.org, hannes@cmpxchg.org
Subject: Re: [PATCH-next v4 1/6] cgroup/cpuset: Fix node inconsistencies
 between cpuset_update_tasks_nodemask() and cpuset_attach()
Message-ID: <ah2b4mpnSLNV0j05@localhost.localdomain>
References: <20260529212108.120506-2-longman@redhat.com>
 <20260529215622.7E3CF1F00893@smtp.kernel.org>
 <6ca6597e-6ca0-4d10-99a9-cca6ca2b2e1a@redhat.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="arraeelhsihktay2"
Content-Disposition: inline
In-Reply-To: <6ca6597e-6ca0-4d10-99a9-cca6ca2b2e1a@redhat.com>


--arraeelhsihktay2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH-next v4 1/6] cgroup/cpuset: Fix node inconsistencies
 between cpuset_update_tasks_nodemask() and cpuset_attach()
MIME-Version: 1.0

Hi.

On Mon, Jun 01, 2026 at 10:04:19AM -0400, Waiman Long <longman@redhat.com> =
wrote:
> > When a node is hot-unplugged, the memory hotplug subsystem removes the =
node
> > from node_states[N_MEMORY] before invoking the notifier chain.

O.K.

> >=20
> > If cpuset_track_online_nodes() calls cpuset_handle_hotplug() but is del=
ayed
> > waiting for cpuset_mutex, and a concurrent write to cpuset.mems acquire=
s the
> > mutex first, wouldn't cp->effective_mems still contain the offlined node
> > while node_states[N_MEMORY] does not?

Not sure this condition could happen -- rewriting cpuset's
effective_mems to a value containing an offlined node.

> >=20
> > This race condition might cause unexpected panics on systems where
> > panic_on_warn is enabled.

That AI reasoning is disputable -- with panic_on_warn=3D1 one kind of
_expects_ panics.
The warning upon a privileged action (memory hotplug) is IMO justified
(and helpful for potential troubleshooting).

The question is whether the warning bears any information and what could
go wrong when the predicate is violated.
Here I see the warning is right before cpuset_update_tasks_nodemask() so
the invalid value may write through to tasks (only assuming the race is
real) -- the warning may be useful.


> OK, will remove the WARN_ON() test to avoid problem.

IOW, if you thought the warning was useful (IMO it's not clear cut),
question that reasoning.


Michal

--arraeelhsihktay2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCah2fuBsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AgllQEAvrnRBpz+ODtjZyXNPFRp
NzSGCaadJoaGIYw6o2Jf38kBAMq0PQRYVLNk5Uq+3wYK9d/pDyYKabU+mxtljmY2
ikYD
=f5wi
-----END PGP SIGNATURE-----

--arraeelhsihktay2--
