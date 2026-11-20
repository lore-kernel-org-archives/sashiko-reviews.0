Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=61.135.153.141
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795167892;
	b=HUHhm9UrskKAdzCcJeRdyldM3vKU9dMiAg+z7rmW/ckO5d0mgIfcw54JocqstdY01Nnj
	 5NyhOu9ChDYcuTzab/mrGaOTkv+R5ZadyAbBeqKip/2oTRSnwnzM6BDVCdlQnLT5EHMtO
	 6tO7FeDe8qbrjo3VkaJzWM1cxJ85xunFvUEqaYcL5QW6lEdyjbOxLKEChj99Rbr4soLnF
	 pefZi3Z1yTIsWtwYHM4zZV4EXvw5vcwhM7/JXmkTnxtxRFwai0eOa12YDcZqjsj8h8p/Y
	 hv7eog3Be3R2pEaC6OK8H8V/8C1DLdwQTQoSx2QTl4edpZ0g0Kb2ZpE4DGZT2J0AGwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167892;
	h=DMARC-Filter:DKIM-Signature:X-SMAIL-HELO:Received:X-Sender:X-Auth-ID:
	 X-SMAIL-MID:X-SMAIL-UIID:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=HdI3Y3CwqBOgEmQB8FbB967dYg8EAUxs8j1MxiAzIpc=;
	b=D6ybE+5D0xBB2/N6c56hcPbBufZjt/PjSv8c3HMf4Z+U0lgrRbR+ASwj/utS+fn8XDXr
	 nSacINJFpccxGODnYe7iv2cUNW2Dt/dEGz8A3cmNwHgEAmD5qrkKPcJpRpzDmH9P5YPhU
	 jbDoneZ80gkd3iK577RVBZeA6asP3/qMW8Z79RZrJNceuekLfrgKP7YjdtHckSFetrfCK
	 ra0HTTujx7jMuLMXhV0Mj8XmVtsnCRDm/9JksCQNycpT0CU/0ZjQJXJ/yAcXEYVRajCzM
	 CftkAmcCcA8sz3TsylXPgWiouNQGUO+kqh20LiA68Nvc2QD0m2W1Eqi75Wy4GmeyzGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sina.com;
	spf=pass smtp.mailfrom=sina.com;
	dkim=pass header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=GmeS8oP8;
	arc=none smtp.remote-ip=61.135.153.141
Received: from smtp153-141.sina.com.cn (smtp153-141.sina.com.cn [61.135.153.141])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF7C606A320
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 09:44:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DF7C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=GmeS8oP8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1795167888;
	bh=HdI3Y3CwqBOgEmQB8FbB967dYg8EAUxs8j1MxiAzIpc=;
	h=From:Subject:Date:Message-ID;
	b=GmeS8oP8S1GfJOO/Fcbv641UoVHo069seRSY0DSGTcjYyB8zmgdXh84fLWp1GmWtr
	 lkfHtApxM99YI8DT6+fAyFlwMmqouPwEv50np5eKTw/mSNpq1VEfSC+2/uamt9CG1P
	 kDVXBLpexvawba7umpessu4Awdj+qaixfZ5VTYzw=
X-SMAIL-HELO: lxu-pcd
Received: from unknown (HELO lxu-pcd)([111.198.225.163])
	by sina.com (10.54.253.31) with ESMTP
	id 6B001683000057BE; Fri, 20 Nov 2026 17:44:38 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 1279716816057
X-SMAIL-UIID: C25E5F20BEAD41B39CA7811D165235F0-20261120-174438-1
From: Edward Adam Davis <eadavis@sina.com>
To: miquel.raynal@bootlin.com
Cc: eadavis@sina.com,
	joern@lazybastard.org,
	linux-mtd@lists.infradead.org,
	richard@nod.at,
	sashiko-bot@kernel.org,
	sashiko-reviews@lists.linux.dev,
	syzbot+ee09ee2112d03c35f1f7@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com,
	vigneshr@ti.com
Subject: [PATCH v2] mtd: Use I/O memory accessors when in an uncached
Date: Fri, 20 Nov 2026 17:44:34 +0800
Message-ID: <20261120094434.107278-1-eadavis@sina.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <87zev3c3kx.fsf@bootlin.com>
References: <87zev3c3kx.fsf@bootlin.com>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 20 Nov 2026 09:25:02 +0100, Miquel Raynal wrote:
> > Thank you for your contribution! Sashiko AI review found 2 potential
> > issues to consider:
> > - [High] mtd: phram: uncached ioremap() pointer exposed via
> >   phram_point()
One point needs correction:
_point and _unpoint should only be registered when phram->cached is true,
because the I/O map is used exclusively when the mapping is uncached.
> > - [Low] mtd: phram: inaccurate Fixes trailer and truncated commit
> >   message
I'll update the subject in the v3;

285133040e6c ("arm64: Import latest memcpy()/memmove() implementation")
In ARM64's __pi_memcpy_generic (arch/arm64/lib/memcpy.S), copies between
33 and 128 bytes branch to L(copy32_128):

L(copy32_128):
    ldp A_l, A_h, [src]
    ldp B_l, B_h, [src, 16]
    ldp C_l, C_h, [srcend, -32]

Here:

    src = 0xffff80009594b000
    count = 0x44
    srcend = src + count = 0xffff80009594b044
    srcend - 32 = 0xffff80009594b024

The instruction ldp x10, x11, [x4, #-32] attempts a 16-byte pair load
from address 0xffff80009594b024, which is only 4-byte aligned (offset
0x24). Because the address points into Device-nGnRE memory, the MMU
generates a Data Abort alignment fault (ESR = 0x96000021, FSC = 0x21),
leading to the reported kernel Oops.

It was introduced by commit 285133040e6c, so I add the Fixes tag for
285133040e6c.
> 
> These issues look plausible, I'll let you answer them.

BR,
Edward
