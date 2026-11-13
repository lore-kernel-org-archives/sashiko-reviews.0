Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794610962;
	b=AO/ytTxB0M4RxXHWU0t3XLmqUb03pwIastXubN9nSCzHr0HdxwTeUikiFNfyEP8ESvnb
	 bQxUQADQ26P94zoolKIIFwBw12WhqR015PZBSvjW4ClB1+Rmb4rA9PzpPm77JtlLykD1k
	 58FOmzuNmy7OW5Wh6M1ndAaLIbBvqJkCOyAQ/g7fJaoyuMlO5/vTdnqnRzuMFEedzztG+
	 t2xrBUpTmqLb7hPtMkpmtOShGgHVLtMf5JHS4GR1krRUORa5us6dyivYYiV31Say3FOvV
	 aYIo+4qkbZtxX7iC6KjfzFqjfulpTGQ5xook7XshFMFrLQiGEN3d8KILwV18y+//CRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794610962;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=Ll4G4Q/q4XxD/HDGmclEgc4oOKKpDop1k/0Nt4LDa/I=;
	b=Qzufdvom12Cr2xLMkzKCQHYI0Vq8yTt6S5m4SKbIXPX+OGZBU/QpmSDTViAnJf9PwUut
	 tTjfOYTI+XGb3bQNr+xUnWrxIwxsZ6iq5ZOWCvZ0DqgQby3p0jj+KK0AC6m91U1Ybiykl
	 atE6LlAWrnAN9eNyl/7HgSvySDMcLZqgk2hIzGaYDfRN0XTlcktXxokyjVZxvQPEvc+QY
	 F32jcIEC4bhTfsjbkedAwZRGJ36EVbFqQjmwklbdJLv+AzRuEUBHInucy6rYLH8O0pKME
	 5OUE1C2Rmce0W0lzf0YnjPBOs2oZvcrKu/CLXfg55MFGV09XDY8a0IXCgqT5tWpm8ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YcWOQZ2m;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FDD606A329
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 23:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YcWOQZ2m
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0C431F000C4;
	Fri, 13 Nov 2026 23:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794610962;
	bh=Ll4G4Q/q4XxD/HDGmclEgc4oOKKpDop1k/0Nt4LDa/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YcWOQZ2mnmKIwfWqO86r36Y2thtdPt7NDxIJB1lck9jkiPFShHR8nf2BIT0tT2NP/
	 JopWy5LGV/I2uPyIA9lN4OxYRrf6K9K9CkF3nsRXOqUvUzFbLh2C98FR/8GCNMwm/Z
	 0tx2fmGRcFyrFI2fEge6AGnEVDVPxd9G0hj2dPVjejCU/RGcqxZr45+HSiSdZdR7/f
	 rEiVVLlYql5q3JybO7rdInm9Ap8JxBPlCdvGSY8fSVvGsaqbj3X9I5cUybgbhNRVv2
	 u8Y5s/KI6ck9NhvAIFsnBadsPV80J19oKVlPlhmPKcc8wWWuj1sjCmE3H4SGUQgQ3C
	 62V0u9JD1cyWg==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 8BD9A3287899; Fri, 13 Nov 2026 23:02:37 +0000 (GMT)
Date: Fri, 13 Nov 2026 23:02:37 +0000
From: Mark Brown <broonie@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Zi Yan <ziy@nvidia.com>, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	sashiko-reviews@lists.linux.dev,
	David Hildenbrand <david@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	David Rientjes <rientjes@google.com>,
	Shakeel Butt <shakeel.butt@linux.dev>, Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>,
	Nhat Pham <nphamcs@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Usama Arif <usama.arif@linux.dev>, Kairui Song <kasong@tencent.com>,
	Balbir Singh <balbirs@nvidia.com>,
	=?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
	Kiryl Shutsemau <kas@kernel.org>,
	Yu-cheng Yu <yu-cheng.yu@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>, Peng Fan <peng.fan@nxp.com>,
	Josef Bacik <jbacik@fb.com>, Chris Mason <mason@kernel.org>,
	linux-mm@kvack.org, Borislav Petkov <bp@alien8.de>,
	Dennis Zhou <dennisszhou@gmail.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: [PATCH 10/13] mm/migrate_device: refuse to migrate shadow stacks
Message-ID: <8b5c7020-76a9-404c-bb2d-dba434c8705f@sirena.org.uk>
References: <avYJ-CxBEpdO1Wmu@gremlin>
 <816E22E2-C7DD-4DD1-AAC9-F51F4D1ED71C@linux.dev>
 <avdveCV9uW1zwXXd@gremlin>
 <F185BA4F-F26B-48EF-AB3C-848D72FA630D@nvidia.com>
 <20261113144316.57192d4ab088e7fc64eee47a@linux-foundation.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Nv7RrJjmbTmkdLju"
Content-Disposition: inline
In-Reply-To: <20261113144316.57192d4ab088e7fc64eee47a@linux-foundation.org>
X-Cookie: Earth is a beta site.


--Nv7RrJjmbTmkdLju
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 13, 2026 at 02:43:16PM -0800, Andrew Morton wrote:

> The main issue is teaching it how to get reliable, high-bandwidth
> access to git and to mailing list archives - LLMs are often blocked for
> <reasons>.  For the mailing-list problem I gave it last-resort access
> to my local 100GB of email archives.  Gulp.  Dovecot's indexing helps a
> lot!

Konstantin has maintainer-containter which does a local lore and git
mirror in a container:

  https://git.kernel.org/pub/scm/utils/maintainer-container/maintainer-container.git

It's early days yet but of particular note here is that it has a MCP
interface.

--Nv7RrJjmbTmkdLju
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCaveXDQAKCRAv73Ows9A4
iXnLAP9Y6nNY+wLgV+TwNUVGYCPbqtqb8GP+nUAiWl6CW6eEzgEAx/RWJknZapZy
kzNGR0pB0nFGmHqW3Kqp1r4hvliX4AM=
=clnb
-----END PGP SIGNATURE-----

--Nv7RrJjmbTmkdLju--
