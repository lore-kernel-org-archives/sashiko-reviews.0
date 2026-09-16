Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA6C524AE0
	for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 16:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789575709; cv=pass; b=AwqVIlvRp/q0fAfBsdAxTyEFL78qKtJQy0QGtuXbKMcBtlge1laN8sELiXQhGAHLQCmb/xKkfqZ0kweEklMBSvur+zQ9vFkIo1JWEVgqVEoPZ70XDSY0AoQHCNffC0RT3wMjSSo6i+x8vodZS8El3xGCEhvLKHW2I2BnJrP6j3Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789575709; c=relaxed/simple;
	bh=xGqkw9om8wE25chq7Li5qakrkd3TSGUIudarLHsXZfQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NPQFeXk2JXvM9Dl3es8XW5Vx0HlbSjmFk2RXpkRT+oww6bLNLk2gb6a2TuVGHigvJKNEZK3hrn1ks/x9PaisewYlxi5ctsNuM/12gFosVXX4bDq7a06LxJH4bnzEL0hfXuMff/6IhtILAOqxa2jFSs5ctwT7WT7q6j7LJRfcysk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com; spf=fail smtp.mailfrom=uber.com; dkim=pass (1024-bit key) header.d=uber.com header.i=@uber.com header.b=wDKVPo+E; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=uber.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uber.com header.i=@uber.com header.b="wDKVPo+E"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d43f9b11aso10460907b3.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 09:21:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789575701; cv=none;
        d=google.com; s=arc-20260327;
        b=DEgbpzoqX9mYNG+L1xeLNOLnnFbGsHe1yk5sHUKVJp25Ph/wqoqlmqSy4AQ4Yj3bxh
         hrp943tuyTNcQUQ6DssWvx4Ss+RTK8irOv5aCv198nM2y13aSTG8L54rGi5/S0PApww7
         xZuCFIxccFXQOeXvJHp3xP5N41APeTabmn8R2pPV4BiVhCdL+chHm32gE4oKFQ7qJcRu
         Ynfc+MnXCzdXriPWLbye4COY9TcEQHxk1ZN3bzRJEBbFKpilw1zDbMfzOGFSiej8I1HI
         +UYUmRVe+zzHg01VNJ/ODTc+15PmemUrvpfplk29GsEZ9di+fNvwL528PqlwUdT9YckD
         H93Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xGqkw9om8wE25chq7Li5qakrkd3TSGUIudarLHsXZfQ=;
        fh=0zVHGC//SC94CWFKHtFt4lnskmkXkJNNy7lE0FDd3Ck=;
        b=LA0uvmWg4eq0NHi8GFfxqgYTrRaB9KuFXo4A64uOYx6Fw0XzSLZogiGgCXx7NywqZ8
         NhGmxdJ/wpC0BBjfgywL/Z46NjU4O9/gw2SBh6uq5lXSgT4Dm14Ig+tv2w76cuIVM7cf
         Fl+O07TNZcf1wb8mUEr+JWMhIx1+Uue+0pBNV7CDx5BfK8l4E4D5HRgb75OW049qIJ4r
         Tbi5nwXaXSyncgOY64Do63V0bt/VcIlUoWhstiuc0owo22h4bbnHtEY+m0V1m3GrNIu5
         oHlw80hp2zilrq/59UR18oz7kIoVZztl0uxYkIiJVrYn4qHCNuQLTZee4zCjBu2SDh9k
         M7yA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uber.com; s=google; t=1789575701; x=1790180501; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xGqkw9om8wE25chq7Li5qakrkd3TSGUIudarLHsXZfQ=;
        b=wDKVPo+EFb2LawiPM7cass/cxY3UdYqLcz+jIfSxKwTKZHs//bFo0ZQs0TeKTUhwMA
         h5AatQTAX6h2jqlGN4cesEU+1Xb9yBJWFe9317yPMC9i1a83pPgTnJVU+EfEQYagI9Ng
         yR0xKtpeoWm3Nkzpq5Q3OaqQEYHzk8/LLAXoo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789575701; x=1790180501;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xGqkw9om8wE25chq7Li5qakrkd3TSGUIudarLHsXZfQ=;
        b=gXxb5N6bRW0eHaBphBgY2exUt4jq6lBb4VP3KYSthMK46wTzRKwI/vvRAMiYyofivA
         bFZxm9Jw+wWawZJ8nLl4T9+WlYovTYfCidSPfje9bF7GJou8PlSXhe9GrCq/6qiNaJVn
         tAQRO0ZsUjBrbM7ozmMLbcqCL5UCs38Ucs2D0+eE4ZFufHIOX1BCItAuUXsaMbNRctVW
         /t12oiJJn6xx49o1aom71dM0giZ90dOfH235G6PmX1trltRSLjcTn/7vX+U23QJGw0yW
         3Vk05Y817r8oWcrUgRohLdAIejtOL68SLaVMUw86r8NuRK90BZ9AqPkEOHYoOKICq+eT
         At9g==
X-Gm-Message-State: AFuF++klRLU5FHetXzUj94WSl+1M0JMs5di21nkyO5J6NguQKxhXn7NZ
	ce8M3geV8GbNvkEBbVPJCeuY5P2rC+KuG+U4eiI4ZAMGGOyAumKfrUyGQ1qasebwRAa2R2jbAsa
	+UPkL4d4KtrMFTzvequRmyIiFeeeYEE7gYoFyGYFsac10Jbdv6kxZGfPMfQ==
X-Gm-Gg: AYBFou0xoyTD1I7uxj+u3//nToMTGGBked7M7s1nE/xiDeusgY1kPSdUqcWi0DeKX8H
	UXRu3SziEph9E6kpD5Rgc5MAORhD7Siaf4ZsCEtmqxziPnhIhErITWHSR2Yl10HPqMfuSj/bJki
	vZmjRWYoYBw7KMhd8kTCC7hIYa8DkMWCgZgA6jaGG55S2fTPOV1/bTM3jxBfCclVqZQv23/3ii8
	bbQbsfi0cpWAeaHPC1sQGRXuD8rTb+TGMjpe+IrkMJqPlQ7i/SfsvLXehYyJHmQw586+eI5XuRl
	2kdrzNMjo7vxA/8Y72OCB3n0KD63My40o4T/Sjka9bzHoHvqNgzdQxPi72HAjiZN6REdOaWshek
	7OG3Xz582TZ8=
X-Received: by 2002:a05:690c:c4e5:b0:883:2240:7dab with SMTP id
 00721157ae682-892207626f4mr11820137b3.4.1789575700451; Wed, 16 Sep 2026
 09:21:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260915-perf-symbol-memory-send-v1-0-1d3360e21f07@uber.com>
 <20260915-perf-symbol-memory-send-v1-4-1d3360e21f07@uber.com> <20260915185035.2D7591F00893@smtp.kernel.org>
In-Reply-To: <20260915185035.2D7591F00893@smtp.kernel.org>
From: Alireza Haghdoost <haghdoost@uber.com>
Date: Wed, 16 Sep 2026 09:21:23 -0700
X-Gm-Features: AcwNN1VdYcZEyvR19ibW-s9HakT46aBZmfAoGbi-EsThjlJWIoi2un2PXZsR2aY
Message-ID: <CA+w=M=T61XoscNet+teD+Dr72GvyfbL-+=2-+0c-JK=rjQmrjA@mail.gmail.com>
Subject: Re: [PATCH 4/4] perf script: Document and test --lazy-load-symbols
 and --max-symbol-bytes
To: sashiko-reviews@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] perf test: missing err=3D2 assignments cause skips to be repor=
ted as success
> - [Medium] perf test: strict byte comparison fails on platforms with diff=
ering debug output
> --

Thanks, both findings are valid. I=E2=80=99ll make the skip paths return
status 2 without overriding a prior failure, and narrow the
eager-versus-lazy comparison to the controlled test symbol rather than
comparing all output from every DSO. I=E2=80=99ll include these fixes in v2=
.
