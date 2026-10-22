Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792653313;
	b=5tTIhf2WEzGNkE7Y6R2OVCUM3h/vZbKTwW6XCpao8GdD84lUU+SHlGk+UTLGP3FOYR+4
	 DdDIe7GV40iQO4mBhaxDK10oUycbiuYnj5WUiErNaUQ0lDXLLnyB4OB+A0vnAZBsLMG1q
	 o6ztu6hJDyb1h3NbJ0N7L5cdLAa75Hpwrz1XZIhcwFWzYc8zbxlMZL08daogirzM/FvYK
	 GeX1FFF3hf5xtbui0vv/aJeFKVmGEFgmQfRM10Y3K2XjeotXBRwzDs676ZyAUZq77MfXp
	 RYIUSbdJ/aYnYDnCRkSvzh+A99M8OOi+XzLNT7e5r5StohtzseXDE4ffO3PzlltdV3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792653313;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Subject:To:CC:
	 References:From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=Za/P3smVo7gdYFPU0LMiITaJ1qndBhudPZ2k00jU2iQ=;
	b=HkbIxOqMHdEOvH7LMWCwLk2Gl++QINHhF/EYHbegbynSVTLtRjU5ZYijViQPDLXDI0Ef
	 KLFLwx4Iqk88Yny8JhCMA5hA5FPNNH0asRXOQKxTzu/6XWCbSNYB2FYbB5umYYvHqkIc1
	 yYCfKNFW9fJt8Tuv1Mu3JWxYlYQgoRXvg3uXex1hlpp1Vb1usRFW0Nk55g3FzgLO6sxZ2
	 BjlWRwE88VcNE6ynAu5n6Aoy1rYP1osMGXVFYbjfu9y8OJcBjx6sQ9+AILPXnUE/aZOxf
	 YHgQz5vpaStx0F1RS88DFBA/rzVeRkgvPs8i6vNmVZscc5VXQ8Mn9wOfsY4RTVaAwlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=nN5qBzq7;
	arc=none smtp.remote-ip=113.46.200.223
Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B65606A31E
	for <sashiko-reviews@lists.linux.dev>; Thu, 22 Oct 2026 07:15:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19B65606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=nN5qBzq7
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Za/P3smVo7gdYFPU0LMiITaJ1qndBhudPZ2k00jU2iQ=;
	b=nN5qBzq7xZ1jWeEAEfDERQqjtAKc8/Kz8fJLviHszC/1JG2xXSX9HZv2oJcn+e6P1oX3D7n2t
	PGORJxN+yQHvBCeZbkD17QLrB4i7xbf3sAQGY+kvodFff0OA9kn/EWDbq55/m637X/svd0/3RWM
	TXAZLyhtC6ES9mqunln2g7Y=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4j9HTs48bPzmV6F;
	Thu, 22 Oct 2026 15:14:57 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id 1D40B40565;
	Thu, 22 Oct 2026 15:15:00 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 22 Oct 2026 15:14:58 +0800
Subject: Re: [PATCH v2] ubifs: zero stale data beyond EOF before file size
 grows
To: Nan Lin <lin.nan@h3c.com>
CC: <linux-mtd@lists.infradead.org>, <richard@nod.at>,
	<sashiko-bot@kernel.org>, <sashiko-reviews@lists.linux.dev>,
	<wangxiaoqing@h3c.com>, <zhou.kete@h3c.com>
References: <9a775528-0259-2b88-d592-08c58b366253@huawei.com>
 <20261022031814.2735650-1-lin.nan@h3c.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <9b07df29-a459-f607-e06c-07aa6b9cf290@huawei.com>
Date: Thu, 22 Oct 2026 15:14:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261022031814.2735650-1-lin.nan@h3c.com>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 whupemo200011.china.huawei.com (7.152.185.179)

ÔÚ 2026/10/22 11:18, Nan Lin Ð´µÀ:
> Hi Cheng,
> 
> Thanks for the detailed review. My responses are inline.
> 
>> The filemap_lock_folio gets folio with FGP_LOCK, I think we should use
>> 'FGP_WRITEBEGIN | FGP_ACCESSED' just like ext4_load_tail_bh() does,
>> because the folio may not exist in ram when calling do_setattr().
> 
> ext4_load_tail_bh() needs FGP_CREAT because in Ext4 the block behind an
> unwritten/delayed extent holds garbage on disk, so the zeroing must
> reach the media. UBIFS does not have this problem -- stale data can
> only live in the page cache, never on flash:
> 
>    writeback:  ubifs_writepage() zeroes the straddling folio on every
>                invocation and skips folios fully beyond i_size, so
>                stale tails never reach the media.
>    read-in:    do_readpage()/read_block() zero the tails of holes and
>                short data nodes, so a folio loaded from flash is always
>                tail-clean.
> 
> So when the EOF folio is absent from the cache, there is nothing to
> zero anywhere: FGP_CREAT would merely allocate a fresh (already zero)
> folio to zero it again. Returning early on IS_ERR() is the correct and
> cheaper equivalent of Ext4's path.

There is one case makes me confused:
File f, isize = 0
1. setattr(f, isize = 3)
    do_setattr -> ubifs_zero_eof_hole -> filemap_lock_folio // gets no 
folio and returns, nothing happens
2. pwrite(f, "123", offset = 6, len = 3)
    ubifs_write_begin
     ubifs_zero_eof_hole -> filemap_lock_folio // gets no folio and 
returns, nothing happens
     folio = __filemap_get_folio(FGP_WRITEBEGIN) // create a new folio 
with random content
     if (!folio_test_uptodate(folio))
       do_readpage // does nothing
        while (1) {
          ENOENT = read_block
        }
    ubifs_write_end
     isize = 9

   ubifs_writepage
    folio content looks like
   | random | random | 123   |   zero       |
   0        3        6       9             4096

According to the current implementations, could above process happen?
If it is, I think we need to do two points:
1. The folio(even not cached) zero range is necessary when setting a new 
bigger size?       -- For 0~3 case
2. The folio(even not cached) zero range is necessary when writting 
starts after old isize?       -- For 3~6 case
I think zeroing the whole folio in ubifs_read_folio(ENOENT case) is a 
simple solution?
> 
>> Why skipping 'from == 0'? What if a user writes begin from
>> offset-X(0<X<4096) to a new file(isize = 0)? Ext4 zero the range by
>> ext4_block_write_begin->folio_zero_segments(folio, to, block_end,
>> block_start, from), but ubifs not handle it.
> 
> from == 0 means the old EOF is folio-aligned, so the EOF folio has no
> bytes beyond EOF and there is no hole in it:
> 
>    from != 0:  |/////valid/////|stale|   <- zero [from, to)
>    from == 0:  |/////valid/////|         <- nothing beyond EOF here
> 
> For the i_size == 0 case: a zero-size file cannot hold a polluted
> folio. mmap cannot create one (page_mkwrite returns SIGBUS when
> folio_pos >= i_size), and write() followed by ftruncate(0) invalidates
> the folio. The [0, X) part of the write folio itself is zeroed by the
> existing do_readpage() path ("block >= beyond" ->
> folio_zero_range()), which is UBIFS's counterpart of
> ext4_block_write_begin()'s folio_zero_segments() -- the work happens
> at folio read-in because UBIFS's block size always equals the page
> size.
> 

This question is similar with the previous one.

>> The ext4 protection check is ext4_write_checks->ext4_block_zero_eof,
>> I think we can add the zero hole check in ubifs_write_iter().
> 
> Agreed. This mirrors ext4_write_checks() -> ext4_block_zero_eof() and
> runs once per syscall instead of once per write_begin() iteration.
> Will move it there in v3.
> 
>> If the program enters into this branch, the ubifs file's isize is not
>> zero, ubifs_read_folio has already zerod tail, do we still need this
>> folio_zero_range?
>> Oh, there is one case, UBIFS file has isize without data nodes(eg.
>> isize = 3, the first block is a data hole), ubifs_read_folio won't
>> zero the page tail, we still need folio_zero_range().
> 
> Right -- and one more case on top of the hole-inode one: mkwrite also
> runs on already-cached folios, and earlier mmap stores may have
> re-dirtied the tail after ubifs_read_folio() cleaned it (only folios
> fully beyond EOF get SIGBUS; the straddling folio stays writable
> across its whole length). So the tail must be re-zeroed on every
> (re-)fault, and the folio_zero_range() stays.

I;m still confusing about the necessary of this folio_zero_range().
For a hole inode(isize = 3, no data nodes), if the folio is cached, 
ubifs_read_folio has zerod the whole folio content(Suspend we have 
applied the simple solution from the previous question). The subsequent 
dirty setting will not write the page content after the 3rd byte to a 
data node.
> 
> For reproducibility I have attached a small single-writer reproducer.
> It covers both size-extending paths (S1: pwrite beyond EOF ->
> write_begin/write_end, S2: ftruncate up -> do_setattr) against a
> polluted old-EOF folio.

Thanks for providing that.
> 
> Build: gcc -O2 -Wall -o eof_hole_test eof_hole_test.c
> Run:   ./eof_hole_test <mountpoint>/eof_hole.bin
> 
> -----------------[ eof_hole_test.c ]-----------------
> /*
>   * eof_hole_repro.c -- repro for "stale data in hole" bug
>   *
>   * Reproduce:
>   *   1. pwrite data to [0, 0x2000)          - full page 0 and 1
>   *   2. ftruncate DOWN to 0x1100            - VFS zeroes page-1 tail
>   *   3. mmap page 1; write junk into [0x1100, 0x1200) via the mapping
>   *      (MAP_SHARED, past EOF)              - pollutes the cache tail,
>   *                                            i_size unchanged, legal
>   *   4. pwrite at 0x3000 (beyond EOF)       - i_size jumps; UBIFS's
>   *                                            ubifs_write_end() does NOT
>   *                                            zero [0x1100, 0x3000)
>   *   5. pread [0x1100, 0x3000): must be all zero.
>   *      Non-zero bytes = stale mmap junk exposed = bug reproduced.
>   *
>   * Scenario 2 uses ftruncate UP instead of pwrite to exercise
>   * do_setattr() instead of write_end().
>   *
>   * Build: gcc -O2 -Wall -o eof_hole_test eof_hole_test.c
>   * Run:   ./eof_hole_test /mnt/flash/eof_hole.bin
>   */
> #include <stdio.h>
> #include <stdlib.h>
> #include <string.h>
> #include <unistd.h>
> #include <fcntl.h>
> #include <errno.h>
> #include <sys/mman.h>
> 
> #define PS       4096
> #define OLD_EOF  (PS + 0x100)   /* 0x1100: old EOF mid-page-1 */
> #define NEW_END  (3 * PS)       /* 0x3000: hole end */
> #define JUNK_LEN 0x100          /* 256 bytes of pollution */
> 
> static int check_hole(int fd, off_t off, size_t len, const char *what)
> {
> 	unsigned char buf[512];
> 	size_t n, i;
> 
> 	while (len) {
> 		n = len > sizeof(buf) ? sizeof(buf) : len;
> 		if (pread(fd, buf, n, off) != (ssize_t)n) {
> 			printf("FAIL: %s: pread error: %s\n", what,
> 			       strerror(errno));
> 			return 1;
> 		}
> 		for (i = 0; i < n; i++) {
> 			if (buf[i] != 0) {
> 				printf("FAIL: %s: byte 0x%02x at offset 0x%llx "
> 				       "(hole offset +%zu)\n",
> 				       what, buf[i],
> 				       (unsigned long long)(off + i), i);
> 				return 1;
> 			}
> 		}
> 		off += n;
> 		len -= n;
> 	}
> 	printf("PASS: %s\n", what);
> 	return 0;
> }
> 
> /* Create a file with EOF mid-page-1, then pollute the page-cache tail
>   * beyond EOF via an mmap write (the only path that skips zeroing). */
> static int make_file(const char *path)
> {
> 	unsigned char junk[PS];
> 	void *map;
> 	int fd;
> 
> 	memset(junk, 0x5a, sizeof(junk));
> 
> 	fd = open(path, O_RDWR | O_CREAT | O_TRUNC, 0644);
> 	if (fd < 0) {
> 		perror("open");
> 		return -1;
> 	}
> 
> 	/* page 1 full of junk, durable */
> 	if (pwrite(fd, junk, PS, PS) != PS) {
> 		perror("pwrite");
> 		goto bad;
> 	}
> 	fsync(fd);
> 
> 	/* shrink: VFS zeroes page-1 tail [OLD_EOF, 0x2000) itself */
> 	if (ftruncate(fd, OLD_EOF)) {
> 		perror("ftruncate");
> 		goto bad;
> 	}
> 
> 	/* re-pollute [OLD_EOF, OLD_EOF+JUNK_LEN) through a shared
> 	 * mapping. This goes through ->page_mkwrite() which does no
> 	 * zeroing. */
> 	map = mmap(NULL, PS, PROT_READ | PROT_WRITE, MAP_SHARED, fd, PS);
> 	if (map == MAP_FAILED) {
> 		perror("mmap");
> 		goto bad;
> 	}
> 	memcpy((char *)map + 0x100, junk, JUNK_LEN);
> 	munmap(map, PS);
> 	return fd;
> 
> bad:
> 	close(fd);
> 	return -1;
> }
> 
> int main(int argc, char **argv)
> {
> 	const char *path = argc > 1 ? argv[1] : "./eof_hole.bin";
> 	unsigned char junk[JUNK_LEN];
> 	int fd, fail = 0;
> 
> 	memset(junk, 0x5a, sizeof(junk));
> 
> 	/* ---------- S1: buffered write beyond EOF ----------
> 	 * exercises ubifs_write_end() appending branch            */
> 	fd = make_file(path);
> 	if (fd < 0)
> 		return 1;
> 	if (pwrite(fd, junk, JUNK_LEN, NEW_END) != JUNK_LEN) {
> 		perror("pwrite");
> 		return 1;
> 	}
> 	fsync(fd);
> 	fail |= check_hole(fd, OLD_EOF, NEW_END - OLD_EOF,
> 			   "S1 write_end: hole [0x1100,0x3000)");
> 	close(fd);
> 
> 	/* ---------- S2: ftruncate UP ----------
> 	 * exercises do_setattr() ATTR_SIZE branch                  */
> 	fd = make_file(path);
> 	if (fd < 0)
> 		return 1;
> 	if (ftruncate(fd, NEW_END)) {
> 		perror("ftruncate");
> 		return 1;
> 	}
> 	fail |= check_hole(fd, OLD_EOF, NEW_END - OLD_EOF,
> 			   "S2 do_setattr: hole [0x1100,0x3000)");
> 	close(fd);
> 
> 	unlink(path);
> 
> 	if (fail) {
> 		printf("\n===> BUG REPRODUCED: stale data visible in hole\n");
> 		return 1;
> 	}
> 	printf("\n===> OK: hole reads as zeros on both paths\n");
> 	return 0;
> }
> ------------------------------------------------------
> 
> --
> Nan Lin
> 
> .
> 

