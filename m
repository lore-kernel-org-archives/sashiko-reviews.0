Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1C8344DAB
	for <sashiko-reviews@lists.linux.dev>; Tue,  9 Jun 2026 15:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781019205; cv=none; b=f/jMaBOZw9mNv4z1OdRRL/DASH9/ZeM5OrDAiSKxS0p2M4ighsg2gUIJEE2G1OuHJceLt/1RW2JsTiHAJ/qTeFG0e2ixq15dPUXoj6YVLFs1l7/E3bmrhxTAbUM9Y+ma3oK3rL9KVQEgryQyYSTlvEZ26C7PZksVaTWxbpUqmHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781019205; c=relaxed/simple;
	bh=1ZdL5TKtcdf3xeGC/5FRerFVJXPhse1RGN6GlqMpjoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N89OuUCBU+HoL1gBpdR+sNC7tbKk8etMTjRj0bVROmZq55sLCqKeyQLwoFYaIi6g3ehENu2Sg6WbJyMKGGHz5qFaeV6d4V3BJfG+hL8UdhKOVnkaffK7kqW7hwYA07HNqyVjQ/I2TL0wbnERZxhkkNGvCjELkNDoSlDUMBogmL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=I//70342; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="I//70342"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5176bbb9384so57212301cf.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 09 Jun 2026 08:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1781019203; x=1781624003; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b6BCUZOSGcGQwGTjfIKiafZBTm2kPzDMfyKQlIS2Xtg=;
        b=I//70342NOw8qVgehZBQAfoVJ8A2h/RD9MlCkTKJPO8NsCLbzURvl6mroU6MF9ilMy
         9ZfsfQ9RyuzLUbdry2+m2fggih9yqY58D4y9S+9VzH77wIsARqnzdmPYpui8NUGJNsAK
         decycOgexK4ra6ggGpCtnpmglAWz3Q07OgtXaB9G7H4e7DlLW1ev6d1PKhIHfatf//rb
         bZD/UnLgd1MEFbdd9SG5z5DE12a2HmH0nHpm7AnPj7Yg4Yfh1i8oxORpeP3ODp9swXun
         nkw92onn4iSwwaUP2ZHC4YzUULYBcUwOIT4Wz08K7yWYKOOZMr5yu1aTSSEY0HCuJPqU
         wFIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781019203; x=1781624003;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b6BCUZOSGcGQwGTjfIKiafZBTm2kPzDMfyKQlIS2Xtg=;
        b=Hy5/1pQEssY0cJwf+meMwCq0vPTlPIOxJD2ElYWpnGX3KzqWzyrYS3cDi5FFwdMZh5
         vPK7T2LTHSrDyKN74yezXgp5mtdf4y2p3n2LlTrQjIcMY7zMZPYdzmYX3KJFRoG5fHAN
         ZJl+1eLdu9Desu3yUKsjSA5P7LL62fl6c/QkPharUEWhqdqLroNYdY4fzPhQv9opVX3u
         aI9l0lz9XWQHz90rlPwu66/6iUNfMOAiW0LROTGaVRSyYftTwe/AmE4p08WNKZOZKNX3
         rbnDUBvt56VTqf5MtfW2J9rS3l1Ztoh2hdWg9G/oLD4Jrez6V4w2L0Kwj+MzHwvEcQlr
         oJIQ==
X-Gm-Message-State: AOJu0Ywn8FkkSERQP7QIJV1WO5agqeDdGZLAtuyQxh47D2v4VXQws3RP
	5m2s2COkIwSZBFU/W/E9jCjJP/SE4kDFwx75Po0wFb/Hrr7VI5UbTsDAZq55BWEg67w=
X-Gm-Gg: Acq92OGoetwcLERAmsWm8sUXxXXin3JPF0UXStCig25xW5mzslVyOVXSWTfsiq1cXbH
	aOBBYGbVPD4ou0ly0Jz8zTr2lCLlFoPYQW4x5fTwmkqATbApEF1zQ1BKS31Mf+MUD3NtB7bopDD
	+KH2Tu1jfxCBppkOe7UnvrG2TJTxSeTu0tRlsBuJnsDvde1k4bLmVkMTvRxRGO+iW7ly2RYW6cN
	RI5zIByoPxLAhR6sd4CjXW9ODO43UCt5VJj2bQSiu+c701+PPYIDlSX7FeNt8B+gGK7Bz1kSnix
	/n4u+gj5zheJoCJBOZBq0kAUJzl1gBv7epPVWTagFGQLIKFflTMkUBQ3fWtxI3elJU1TCfJvFBu
	NnXEGR+kUJj8w9a5dyPn6rxOC8P5AVPyCnqt2vJ1PM76AyYf5Uhw5hPb6S/virEE7KzFivYALOU
	F5sbfITAaJ4hmWy473BAiz4h24DdwvnAbc+6ftft8Hv5NcDl0ZP62z0pbXerZrJ5RcDPfer7Brv
	43hZ/Br6ujFQ008Yg==
X-Received: by 2002:a05:622a:1451:b0:516:e10f:b1fa with SMTP id d75a77b69052e-51795b0cfa8mr290431301cf.2.1781019203248;
        Tue, 09 Jun 2026 08:33:23 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775dffb14sm193985651cf.28.2026.06.09.08.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:33:22 -0700 (PDT)
Date: Tue, 9 Jun 2026 11:33:21 -0400
From: Gregory Price <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, linux-mm@kvack.org
Subject: Re: [PATCH v4 6/9] dax: plumb hotplug online_type through dax
Message-ID: <aigyQcBH3HRrOn23@gourry-fedora-PF4VCD3F>
References: <20260605211911.2160954-7-gourry@gourry.net>
 <20260605213143.A18F01F00893@smtp.kernel.org>
 <aiNFezMarbvIZNa0@gourry-fedora-PF4VCD3F>
 <878faef6-bbd3-43ec-af82-6da675a5f8fe@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878faef6-bbd3-43ec-af82-6da675a5f8fe@kernel.org>

On Tue, Jun 09, 2026 at 12:21:34PM +0200, David Hildenbrand (Arm) wrote:
> On 6/5/26 23:54, Gregory Price wrote:
> >>
> >> [Severity: High]
> >> Does capturing the auto-online policy at device creation time break dynamic
> >> sysfs policy changes?
> >>
> > 
> > @David - we talked about this ~6+ mo ago at this point, i originally
> > proposed something like MMOP_SYSTEM_DEFAULT
> > 
> > https://lore.kernel.org/linux-mm/20260114085201.3222597-3-gourry@gourry.net/
> > 
> > https://lore.kernel.org/linux-mm/c4ed9675-269c-4764-86d5-87f4f83fc74d@kernel.org/
> > 
> > '''
> >    I don't like having fake options as part of this interface.
> > 
> >    Why can't we let selected users use mhp_get_default_online_type() 
> >    instead? Like add_memory_resource(). We can export that function.
> > '''
> > 
> > I guess the argument here is that the value can't be cached?
> > 
> > But we can't really enforce that.
> > 
> > This is a behavioral change we have to agree on (either we change it or
> > carry something like MMOP_SYSTEM_DEFAULT for this).
> 
> I don't think we'd need a generic MMOP_* for that purpose (the core cannot
> really do a lot with that AFAIKS, and the scenario "unspecified" doesn't really
> occur in memory hotplug core).
> 
> I guess you could have some indication whether the user already configured it
> manually (bool online_type_specified), and handle that in the handful of places.
> 
> if (dev_dax->online_type_specified)
> 	online_type = dev_dax->online_type;
> else
> 	online_type = mhp_get_default_online_type();
>

Hm, I suppose this would do it.

I'm using -1 as "DAX_UNPLUGGED" at the moment, but I could actually just
add MMOP_UNPLUGGED as an explicit mode which only has relevance to callers
of hotplug (the state of the hotplug region they currently control is
MMOP_UNPLUGGED) - but not to hotplug itself (memory_hotplug.c doesn't
use it / rejects it).

Then i could use (dev_dax->online_type == -1) to mean "use system
default"

I'll bring this up in the mmop/str patch whether we should add
MMOP_UNPLUGGED.

> Of course, you could also just call the old interface when adding without a
> preference.
>

This is essentially the same thing, but we'll eventually want to pass an
online_type through the interface, so may as well just do as above.

> A negative online_type could also be used as "unspecified" in your code (MMOP_
> starts at 0).
> 
> But the question really is which semantics we would want? is that exposed to
> user-space somehow, such that the user could query it ("default")? or how does
> this get set, and how does it later get used while it could have changed
> system-wide?
> 

I think this is the core question.

What selection of these values do we want?

  echo default        > .../dax0.0/hotplug  # -1
  echo unplugged      > .../dax0.0/hotplug  # MMOP_UNPLUGGED
  echo offline        > .../dax0.0/hotplug  # MMOP_OFFLINE
  echo online         > .../dax0.0/hotplug  # MMOP_ONLINE
  echo online_kernel  > .../dax0.0/hotplug  # MMOP_ONLINE_KERNEL
  echo online_movable > .../dax0.0/hotplug  # MMOP_ONLINE_MOVABLE

  echo default        > .../memoryN/state   # -EINVAL - nonsensical
  echo unplugged      > .../memoryN/state   # -EINVAL - nonsensical
  echo offline        > .../memoryN/state   # MMOP_OFFLINE
  echo online         > .../memoryN/state   # MMOP_ONLINE
  echo online_kernel  > .../memoryN/state   # MMOP_ONLINE_KERNEL
  echo online_movable > .../memoryN/state   # MMOP_ONLINE_MOVABLE

And lets say the use sets a value, should they be able to return it to
the system default?  I don't think that makes much sense, considering
the default is really only used on probe.

i.e.:

  cat .../dax0.0/hotplug                     # default
  echo online_movable > .../dax0.0/hotplug   # online_movable
  echo default > .../dax0.0/hotplug          # -EINVAL?

The point being that .../dax0.0/hotplug doesn't exist unless the dax
device is already bound to kmem - and so by the time you can set it, the
point at which (hotplug == default) being useful is already passed.

Does this seem reasonable?  The tl;dr is

+ MMOP_UNPLUGGED
+ #define DAX_HOTPLUG_DEFAULT  (-1)
+ dev_dax->online_type = DAX_HOTPLUG_DEFAULT;

~Gregory
