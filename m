Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794987625;
	b=sqZh4yHiS5A/Las6FP9vlyU0soexpdUWzOVYQEyB/8egmwfCSHArxB5eiuuGqr8uS6EE
	 e/e+sn5vs4wIY33deAHMkfohZnhuL8CpZhVPSVRiLWTtG9O7V4++sS7opB2QB3b+7Atiy
	 A4iBj4b2NDZ9CFuObJuJbebW67n1eAUnM3KhTjWJIW+MgWORyNZifSwc/pT1+HUUuWgLZ
	 4HV4O1/46Bn4wWw34Wjfy4bLhtZTmPQNtH1ZusPixwRn3AyaINmRrCH1WggzteVXLVl65
	 p8hKh6bMq7yyEj79UAc8EjffiHclvjrfWHTwStZVN0q15mfkkOHaE8VF/JRS4CGbItw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987625;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=V+Q/b4oQQRcc2ev9VIFrb3ozJoPLTXTZ4ZqHagDQPao=;
	b=u+Dr0nTqgJeK6focfbVbEjMHcD8ceiUeD/xDHBtMCjMphHtDC5Ms72BR4B+0luGsSVkO
	 dIbaLmRNWWQ/szEhJrQazbHT82ofLqrlevrBjVZPHwcrDY+w9xDaQJaQiSBM8uRQGWKUP
	 uICWxVXXkfFJyQntL5G6w5vqiAT5K1Fha2PCtthQPaxDYxCXWGl9UAeOpsmQnh5YpTMwT
	 YEYzPhbNGKGNYBXhZt2ll44P47XV7XnuIkcdZ5vEqx6T6hACxkjrOWiviwoqKZgBFFlF6
	 ed4mJy0mnxIQP5YkUAyfVVDEy4xeU+ZI1LzcUTevywn1XPxENtPvktcpYGwHNmNxnrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aThAsX8w;
	arc=none smtp.remote-ip=74.125.227.133
Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335C0606A325
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 07:40:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 335C0606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aThAsX8w
Received: by mail-pj2-f5.google.com with SMTP id d9443c01a7336-2efd4a0bd68so2281815ad.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 23:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794987624; x=1795592424; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=V+Q/b4oQQRcc2ev9VIFrb3ozJoPLTXTZ4ZqHagDQPao=;
        b=aThAsX8w1ErtdUAbeKp2JD60296VSEmpb3eCUM2KP+jhdww6NSHNM3LiRpzRHjbzfX
         KRA/0UKCmVgalh8ygrY+IIOer81SPduI2PLwPnsYiXsYgLatwr4aFNugMJm0eieoKOrN
         6C2IAJHmNwr6keBVp1n7jlI/IMI5Grvc11EJAJRLqOrYVfYhRM1uZCwICsjWjQB0JwWc
         WjPzq5BfDI3q0vXmqsxtDJWoGm7+XW8Bj9sBESM5p9IXx8sSDXtnBXi2iffICsFxQiGB
         ZXQSrMEJVL8RwhEc9Pdm+KMFH1KtFGUh2r9p4/EMs70UVih0ngEOsP/g9+V3J+QFjHcJ
         UK7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794987624; x=1795592424;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=V+Q/b4oQQRcc2ev9VIFrb3ozJoPLTXTZ4ZqHagDQPao=;
        b=OaBVMHfKwJBxZEshjrJGg2CfhQWZOht0nZ3AW9SRuP/r655nVES80v/yEA6cxQsn8u
         POvQ9xKap7v6rmgdLeES063H63WrnqrxsPwZhzdX1+2VqadHRsVg3W9BJtxtFSQGKBTx
         JVKQNf0GZlKTle483ks2dXcgkIbX2QRx6c0cJsOioV7/SsTnP/c1jYQTnOUF7GfBZn/k
         /wbd0mLErprC2QpKlwnmYAmzosA/AS62VUvJnOCmbIoYPLjZfRYwuZoG6wH1jCy24rh9
         HZdKdiJOZHxz3BJPVkO/x7ri/pgzNzmQVaJvW+JoF8cxLxCC9BkTkJst5h75KyxsPk77
         7kvg==
X-Forwarded-Encrypted: i=1; AL+hErGaqFW4I1+KLtwHIvbVVl8PSEgpB+RP2+1rntPnvMgCFRbYUEglIot0KnMACv/4m9MMrINyl8OiToRdPZoFnMg=@lists.linux.dev
X-Gm-Message-State: APuU4Z+wagjdjYLzoFR8ea16EAPnhfKcgynLFBHF7keZb40l9Pj/mwzB
	Gv0wX4ksC2beJH/m2MhkpeqR+CI/iKN7evo0zymd1Z1x3H5rTuTmEEur
X-Gm-Gg: AZFdTZdMFVLkNV14GETS2W6g/Gk38+Y7vu3Vgjli1CPYAPxr1gJl8tA0rSMqBDU1g1V
	fQfpSu7Q+LQl19ghFgWtP3HzP8KB43uBuslIUGq27I9ox9h3VKX68CBpkPOW3iSU6kAv2CnMD2P
	fq2OVzVyceR7rHr1CK9i3cUkXVckse2m1r5hiFFWJeaEXb6HvrnhjzXuz854OO/EBH/L/G0hxYd
	let1tGECu3pdnipOiexvI0fV9e5SJfEQPIq5P9/mO4eyvhMChzAyeKhSPwi1GmyvdVkmEBPn9lO
	ktO9haFo0NjR63SNcDNlsyWRryE57q9BQaNDQsbdrXnnM8yGluPzJXmApmRD9S2iH8k7De4OxXe
	pv+3h/Pht1+5NHeWTfIhgj3rdCuQRfMTrdYMOGJQJ92VgCa7hE1BJ36Q+99gqe6AJ6uHnpjR+nK
	OLHpTWRWdb3nQ1WAhMQgcVmydwI4XMAhpdJa1nR85SUErzGIpaH3j+yvYOjUHc7asrbEmRr1Nis
	nb2hZp9KuFm7VxQVaLFlv4ueatHb/Ckoc04g2H97JvXAj/QzEdq77TC5Ssi6LDPxofgtawez6OY
	zjeNLU6lCfG06OhiRYOQg4wtUhXUK0wfn8qznXwyOS+6WYaH43uKHIOMTD4v7e5s2NarejhEDYS
	WIMpaIMfwORsTVXBK2KKRwPXteCS0DLuBnfwEd3bObygcLxIT6qxz0lbLiKDJig==
X-Received: by 2002:a17:902:d505:b0:2ef:e044:290c with SMTP id d9443c01a7336-2eff75451bdmr16959655ad.25.1794987624447;
        Tue, 17 Nov 2026 23:40:24 -0800 (PST)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6214565sm8667315ad.42.2026.11.17.23.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:40:23 -0800 (PST)
From: Aveline Noir <jm5905938@gmail.com>
Date: Wed, 18 Nov 2026 03:24:28 +1100
Subject: [PATCH v2] mm/damon/paddr: skip non-LRU folios as a whole in
 pageout
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-fix-damon-hugetlb-pageout-20261117-v2-1-547a65a3206e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/z2N2w6CMBBEf4XssxsBRaO/QnzY0rWtkZb0IiaEf
 7eVhMczmTmzQGBvOMC9WsDzxwTjbIb2UMGgySpGIzNDW7eXpmmu+DRflDQ6izopjm+BEyl2KeJ
 eoTPXJ3mTHXUCsmjynFf/k/6xcUjixUMs5tIQFBiFJzvoEm3+OLvdeRxHtDzDuv4Ap29dr7IAA
 AA=
X-Change-ID: 20261117-fix-damon-hugetlb-pageout-20261117-a4e03d9d5a5b
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, damon@lists.linux.dev, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, sashiko-bot@kernel.org, 
 sashiko-reviews@lists.linux.dev
X-Mailer: b4 0.16.0

damon_pa_pageout() uses damon_get_folio(), which rejects folios that are
not on the LRU.  For a large non-LRU folio such as a hugetlb folio, the
loop then looks up the same folio once per base page even though
pageout cannot reclaim it.

Use damon_get_monitor_folio() and skip any returned non-LRU folio as a
whole by advancing to its end.  Do this before the filters, the
accounting and the last_applied check, so that adjacent regions within
the same non-LRU folio are not walked by base page either.

In an x86-64 KVM pageout microbenchmark, traversal time dropped by
about 99.7% for regions covering whole 2 MiB hugetlb folios. For
4 KiB regions within hugetlb folios, traversal took about 1 ns more
per region.

Signed-off-by: Aveline Noir <jm5905938@gmail.com>
---
Tested in x86-64 KVM guests.  DAMON KUnit tests all passed.  Ordinary-page
and THP controls passed the 3% non-inferiority bound in the microbenchmark.

Changes in v2:
- Drop the redundant hugetlb check and update the subject and description
  as suggested by SJ.
---
 mm/damon/paddr.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/mm/damon/paddr.c b/mm/damon/paddr.c
index 5b773012a876..0a205fa8d468 100644
--- a/mm/damon/paddr.c
+++ b/mm/damon/paddr.c
@@ -268,7 +268,9 @@ static unsigned long damon_pa_pageout(struct damon_region *r,
 
 	addr = damon_pa_phys_addr(r->ar.start, addr_unit);
 	while (addr < damon_pa_phys_addr(r->ar.end, addr_unit)) {
-		folio = damon_get_folio(PHYS_PFN(addr));
+		folio = damon_get_monitor_folio(PHYS_PFN(addr));
+		if (folio && !folio_test_lru(folio))
+			goto put_folio;
 		if (damon_pa_invalid_damos_folio(folio, s)) {
 			addr += PAGE_SIZE;
 			continue;

---
base-commit: 67f3b04b277373438f17300e056306adbd9edf7b
change-id: 20261117-fix-damon-hugetlb-pageout-20261117-a4e03d9d5a5b

Best regards,
--  
Aveline Noir <jm5905938@gmail.com>

