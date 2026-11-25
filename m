Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.42.244.94
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795622984;
	b=uJ2N74qwmMDaShewJ1gxbpXUaXp+vhkupsmKNrHwlVhs0tDA8lfdQx1foL6xXmfg/1eJ
	 KYq749SlYz85CYSUMR/J8skMb/xw8uj3311rmU6qbBNmSnEEPlPR3ekKNuxncRbLbCMw4
	 +XNU0oJj/BlMwmxDgInamrAkSvYlLqXNuyunLtLG3P7XqSWK6AmRZLyKwplGALeOcL9TJ
	 6QOysS/LLWARWkKnWGvihtXBIVP2RpuID03zxe3iUME6VmepRkr4bi3XlW4S5KCE+6IK3
	 fjl8+PuOp6fGg6GsBF4HOwgiKltQAFzuY+mYh+dVnhxp22g82MG9WlNrMxLXXB/AB8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795622984;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization:x-ms-reactions:
	 X-purgate-ID:X-purgate-type:X-purgate-size:X-Notice:X-purgate:
	 X-purgate:X-pfmilter;
	bh=h87IU5ETAr92o0NDzYh3Y5hYItUDXx2Nc2p6yBWTFDk=;
	b=f+jzOfEmyzDNPCwP1qC0oAek69ZDnGYs4HgFQzWwsALZdq/XO44s/ywlfypqlJJHEYg2
	 ToT8n9oKi00ZeBp/dNmZI9MxU2sszI2AGeobRKvfLlVugNZVebbXPBM6CBTO84INsBZ6z
	 VRFm0D4qKZTL5qSfVwpP8HS6lCAd7cv87wf0u1yDTKHx1M1imNkvMvbYxJwwh0RVXV0RD
	 PBYJtTnfg4eTXrOs+/tnKq92q1iEQpL0P2It45XXcPyJz0/Onc0KZ0hVKRREwU0NUYX6z
	 7eRRwA5IP8akEFP9uFsGpf1KMPEJI4WLcQc/IcWC8RojeTIDDGEcKYYtvq6mEvzUUzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fritz.com;
	spf=pass smtp.mailfrom=fritz.com;
	dkim=pass header.d=fritz.com header.i=@fritz.com header.a=rsa-sha256 header.s=mail header.b=IAlypTa5;
	arc=none smtp.remote-ip=212.42.244.94
Received: from mail.avm.de (mail.avm.de [212.42.244.94])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30E4606A321
	for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 16:09:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B30E4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fritz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fritz.com header.i=@fritz.com header.a=rsa-sha256 header.s=mail header.b=IAlypTa5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fritz.com; s=mail;
	t=1795622974; bh=kkOxP4Y4DHTYTBqjoAVvMOI6fQgUQ/6viYIQ9Su5IWc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IAlypTa5GHgR1HXRhP2YhXPF5ZfnkL+hL14ya1nZbn+tGPoqfX6nTAipKe0YRZNmz
	 BnS9Gezy3dYjFMW7SEBM5CpiZ1N4h9IvvYeZ+8ooJ3EXuAfsMkNmmigoIDNKIeewfQ
	 tGffWpE83+sphJ7rSQkALc8Yz69i7eypXLabDchaLtg0nEFXNWpH6YEoIQEkoFPazC
	 hvTza4XSGG7g9cmPH5dX+J7sCM+g60YqBIPR4Udqz/CFkEBetlyZYAriOEE7ZoV8Xc
	 kDcb4vQkMMyEsYjqz0EgNuQJLqqqmD1gr8DMQY04z1BGrO0u7867JJ9wj67IvHgGmb
	 WDziJOaUhwnrw==
Received: from [212.42.244.78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.57.1)
	(envelope-from <n.schier@fritz.com>)
	id 6b07083e-072e-7f0000032729-7f0000019bde-1
	for <multiple-recipients>; Wed, 25 Nov 2026 17:09:34 +0100
Received: from mail-auth.fritz.com (unknown [212.42.244.78])
	by mail.avm.de (Postfix) with ESMTPS;
	Wed, 25 Nov 2026 17:09:34 +0100 (CET)
Date: Wed, 25 Nov 2026 17:09:32 +0100
From: Nicolas Schier <n.schier@fritz.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: sashiko-reviews@lists.linux.dev,
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Christian Heusel <christian@heusel.eu>,
	linux-kbuild@vger.kernel.org,
	=?utf-8?B?QWRyacOhbiBHYXJjw61h?= Casado <adriangarciacasado42@gmail.com>,
	Nicolas Schier <nsc@kernel.org>
Subject: Re: [PATCH] kbuild: package: Install System.map to build tree only
Message-ID: <20261125-mouflon-of-uncanny-ampleness-b7d019@l-nschier-z2>
References: <20261116-package-install-system-msp-to-build-dir-v1-1-ec53d3d39146@kernel.org>
 <sashiko-outbox-219115@kernel.org>
 <20261122213504.GA1454693@ax162>
 <awRijCPFYK4J5L6C@levanger>
 <20261124030324.GA2247258@ax162>
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
Content-Disposition: inline
In-Reply-To: <20261124030324.GA2247258@ax162>
Organization: FRITZ! Technology GmbH
x-ms-reactions: disallow
X-purgate-ID: 149429::1795622974-71D89A2B-D3593F8E/0/0
X-purgate-type: clean
X-purgate-size: 4027
X-Notice: Whitelisted
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-pfmilter: host: postfix-mx-03  mail-id: 253A2A25D4  external: no

On Mon, Nov 23, 2026 at 08:03:24PM -0700, Nathan Chancellor wrote:
> On Mon, Nov 23, 2026 at 04:58:04PM +0100, Nicolas Schier wrote:
> > As Distros are moving everything to /usr/ -- but I haven't seen
> > /usr/boot/ anywhere -- I'd prefer to move it away from /boot.  The
> > kmod build tree looks like the native location to me (as per
> > scripts/depmod.sh) and from what I can find, most debugging tools use
> > vmlinux or /proc/kallsyms rather than System.map; but I have never ever
> > tried to debug a Linux without the full source + build tree at hand.
> 
> I guess we could try it and see who complains about the new location.
> 
> I am just not sure that we should treat scripts/depmod.sh expecting
> System.map in the build folder as anything more than "external modules
> won't have dependencies generated properly" (which is more of a missing
> feature than a true bug) than "System.map does not belong in /boot" but
> I don't have a really strong opinion here.
> 
> > Does System.map still help with regular debugging with CONFIG_KASLR
> > enabled?
> 
> I think for debugging, you would want KASLR off?

Yeah, but I guess when switching of KASLR Linux is rebuilt, thus usually 
there are more valuable sources for debugging are available than 
System.map.

> 
> > If it wasn't for 'depmod -e' I'd like to put System.map to the
> > linux-image-${KVER}-dbg_*.deb, as Debian does.
> > 
> > 
> > > Something
> > > like this maybe (completely untested):
> > > 
> > > diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> > > index ba1defc61652..4261963a901e 100755
> > > --- a/scripts/package/builddeb
> > > +++ b/scripts/package/builddeb
> > > @@ -147,6 +147,13 @@ install_kernel_headers () {
> > >  		"${srctree}/scripts/package/install-extmod-build" "${pdir}/usr/src/linux-headers-${version}"
> > >  	fi
> > >  
> > > +	if [ "${ARCH}" = um ] ; then
> > > +		system_map="/usr/lib/uml/modules/${KERNELRELEASE}/System.map"
> > > +	else
> > > +		system_map="/boot/System.map-${KERNELRELEASE}"
> > > +	fi
> > > +	ln -s "${system_map}" "${pdir}/usr/src/linux-headers-${version}/System.map"
> > > +
> > 
> > What about doing it the other way round?  We could provide the symlink
> > in the old /boot/ location for now and move System.map to the module
> > build tree?
> 
> We would have to make sure that this location was available without
> CONFIG_MODULES but that wouldn't be a bad option either.

Ack, thanks.

> 
> > >  	mkdir -p $pdir/lib/modules/$version/
> > >  	ln -s /usr/src/linux-headers-$version $pdir/lib/modules/$version/build
> > >  }
> > > diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
> > > index 8f0933cbbe45..3add2b2c7dd2 100644
> > > --- a/scripts/package/kernel.spec
> > > +++ b/scripts/package/kernel.spec
> > > @@ -122,6 +122,7 @@ fi
> > >  ln -fns /usr/src/kernels/%{KERNELRELEASE} %{buildroot}/lib/modules/%{KERNELRELEASE}/build
> > >  %if %{with_devel}
> > >  %{make} %{makeflags} run-command KBUILD_RUN_COMMAND='${srctree}/scripts/package/install-extmod-build %{buildroot}/usr/src/kernels/%{KERNELRELEASE}'
> > > +ln -fns /lib/modules/%{KERNELRELEASE}/System.map %{buildroot}/usr/src/kernels/%{KERNELRELEASE}/System.map
> > 
> > Looking at line 122 (start of hunk), /lib/modules/%{KERNELRELEASE} seems to be a symlink to
> > /lib/modules/%{KERNELRELEASE}/build/, thus that line will would create a
> > funny symlink. ;)
> 
> /lib/modules/%{KERNELRELEASE} is a folder created at the beginning of
> the %install stage. /lib/modules/%{KERNELRELEASE}/System.map is where it
> is installed during this stage, so symlinking it to
> /usr/src/kernels/%{KERNELRELEASE}/System.map should make it appear at
> /lib/modules/%{KERNELRELEASE}/build/System.map as expected.

gosh, sorry. I mis-read the diff and wrote even more nonsense.

> But as I mentioned above, I am totally fine with going the other way.

Thanks, then I am going to update the patch accordingly.

-- 
Nicolas
